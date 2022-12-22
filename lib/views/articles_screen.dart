import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_bloc/news_bloc.dart';
import 'package:news_app/views/widgets/news_tile.dart';

import '../models/article.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    context.read<NewsBloc>().add(FetchNews(index: _tabController.index));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _controller.jumpTo(0),
          child: Icon(Icons.arrow_upward_rounded),
        ),
        body: RefreshIndicator(
          edgeOffset: 100,
          onRefresh: () async => context
              .read<NewsBloc>()
              .add(FetchNews(index: _tabController.index)),
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              SliverAppBar(
                elevation: 5,
                floating: true,
                title: Text("News App"),
                bottom: TabBar(
                    controller: _tabController,
                    onTap: (index) =>
                        context.read<NewsBloc>().add(FetchNews(index: index)),
                    padding: EdgeInsets.only(bottom: 2),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    tabs: const [
                      Tab(
                        text: "Top Headlines",
                      ),
                      Tab(
                        text: "Sports News",
                      ),
                      Tab(
                        text: "Business News",
                      ),
                    ]),
              ),
              BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                if (state is NewsLoading) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is NewsLoadingSuccess) {
                  return showArticles(state.articles);
                } else if (state is NewsLoadingError) {
                  return SliverFillRemaining(
                    child: Center(child: Text(state.error)),
                  );
                } else {
                  return SliverToBoxAdapter(child: Container());
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  showArticles(List<Article> articles) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(((context, i) {
      return NewsTile(
        article: articles[i],
      );
    }), childCount: articles.length));
  }
}
