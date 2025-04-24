import 'package:dio/dio.dart';
import 'package:emenu/mvvm/data/model/emenu_param/emenu_param.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'emenu_config_api.g.dart';

@RestApi()
@injectable
abstract class EmenuConfigApi {
  static const String branch = '/app/api/v2';
  static const String getParamsApi = '$branch/config/getParam';

  @factoryMethod
  factory EmenuConfigApi(Dio dio) = _EmenuConfigApi;

  @GET(getParamsApi)
  Future<HttpResponse<ResponseData<EmenuParam>>> getParams(
      {@Queries(encoded: true) required Map<String, dynamic> queries});
}
