import 'package:forja/features/home/data/model/movies_model.dart';

import '../../../../core/networking/api_service.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<Movies> home() async {
    return await _apiService.home();
  }
}
