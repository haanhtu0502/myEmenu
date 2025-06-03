import 'package:dio/dio.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'request_api.g.dart';

@RestApi()
@injectable
abstract class RequestApi {
  static const String branch = '/app/api/v2';
  static const String branchv1 = '/app/api/v1';
  static const String saveRequestApi = '$branchv1/requestOrder/saveAll';

  @factoryMethod
  factory RequestApi(Dio dio) = _RequestApi;

  @POST(saveRequestApi)
  Future<HttpResponse<ResponseData>> saveRequest(
      {@Body() required Map<String, dynamic> queries});
}
