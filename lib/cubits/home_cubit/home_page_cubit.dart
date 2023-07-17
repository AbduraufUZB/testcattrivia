import 'package:bloc/bloc.dart';
import 'package:cat_trivia_app/data/model/cat_trivia_model.dart';
import 'package:cat_trivia_app/data/repository/api_repository.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  ApiRepository apiRepository;
  HomePageCubit({required this.apiRepository}) : super(HomePageInitialState());

  Future<void> getNewDataFromApi() async {
    emit(HomePageLoadingState());
    CatTriviaModel? catTriviaModel = await apiRepository.getData();
    if (catTriviaModel != null) {
      emit(HomePageLoadedState(catTriviaModel: catTriviaModel));
    } else {
      emit(HomePageErrorState(error: "Data null"));
    }
  }
}
