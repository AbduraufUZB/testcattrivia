part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  CatTriviaModel catTriviaModel;
  HomePageLoadedState({required this.catTriviaModel});
}

class HomePageErrorState extends HomePageState {
  String error;
  HomePageErrorState({required this.error});
}

class HomePageInitialState extends HomePageState {}
