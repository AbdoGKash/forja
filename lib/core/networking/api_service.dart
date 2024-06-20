import 'package:dio/dio.dart';
import 'package:forja/features/home/data/model/movice_model.dart';
import 'package:retrofit/http.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.home)
  Future<Movice> home();
}
