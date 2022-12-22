import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article.dart';
import 'package:share_plus/share_plus.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final Article article = argument['article'];

    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        actions: [
          IconButton(
            onPressed: () {
              Share.share(article.url);
            },
            icon: Icon(
              (Icons.share),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              article.title,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              article.source.name,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              article.content,
              maxLines: 100,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      )),
    );
  }
}
