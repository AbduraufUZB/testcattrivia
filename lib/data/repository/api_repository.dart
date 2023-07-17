import 'package:cat_trivia_app/data/model/cat_trivia_model.dart';

import '../service/api_service.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });

  final ApiService apiService;
  Future<CatTriviaModel?> getData() async {
    final response = await apiService.getDatas();

    return CatTriviaModel.fromJson(response!.data);
  }
}
