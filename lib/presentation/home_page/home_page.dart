import 'dart:math';

import 'package:cat_trivia_app/cubits/home_cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomePageCubit, HomePageState>(
      builder: (ctx, state) {
        if (state is HomePageLoadingState) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is HomePageErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is HomePageLoadedState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://cataas.com/cat?${Random().nextInt(100)}"))),
                ),
              ),
              const Text(
                "ABOUT",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                state.catTriviaModel.text.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                state.catTriviaModel.createdAt.toString().split(" ")[0],
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    await context.read<HomePageCubit>().getNewDataFromApi();
                  },
                  child: const Text("New Data"))
            ],
          );
        } else {
          return const Center(
            child: Text("initial route"),
          );
        }
      },
    ));
  }
}
