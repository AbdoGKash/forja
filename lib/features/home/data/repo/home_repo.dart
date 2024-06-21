import 'package:forja/features/home/data/model/movice_model.dart';

import '../../../../core/networking/api_service.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<Movice> home() async {
    return await _apiService.home();
  }
}
