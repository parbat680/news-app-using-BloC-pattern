import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article.dart';
import 'package:share_plus/share_plus.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  NewsTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/articleDetails',
                  arguments: {'article': article});
            },
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  article.title,
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                article.source.name,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              IconButton(
                  onPressed: () {
                    Share.share(article.url);
                  },
                  icon: Icon(Icons.share, color: Colors.black))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
