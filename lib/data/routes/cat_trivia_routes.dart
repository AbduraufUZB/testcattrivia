import 'package:cat_trivia_app/presentation/history_page/history_page.dart';
import 'package:cat_trivia_app/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';

class CatTriviaRoutes {
  static final CatTriviaRoutes _instance = CatTriviaRoutes._init();
  static CatTriviaRoutes get instance => _instance;
  CatTriviaRoutes._init();
  Route? onGenerateRoute(RouteSettings s) {
    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (ctx) => const HomePage());
      case "/history":
        return MaterialPageRoute(builder: (ctx) => const HistoryPage());
    }
  }
}
