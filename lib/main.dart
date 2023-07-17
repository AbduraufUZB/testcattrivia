import 'package:cat_trivia_app/data/routes/cat_trivia_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/home_cubit/home_page_cubit.dart';
import 'data/repository/api_repository.dart';
import 'data/service/api_service.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => HomePageCubit(
            apiRepository: ApiRepository(apiService: ApiService.instance))
          ..getNewDataFromApi(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Trivia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: CatTriviaRoutes.instance.onGenerateRoute,
      initialRoute: "/home",
    );
  }
}
