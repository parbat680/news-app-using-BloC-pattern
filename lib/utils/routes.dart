import 'package:flutter/cupertino.dart';
import 'package:news_app/views/article_details.dart';
import 'package:news_app/views/articles_screen.dart';
import 'package:news_app/views/splash_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/splash": (context) => SplashScreen(),
  "/home": ((context) => Articles()),
  "/articleDetails": ((context) => ArticleDetails()),
};
