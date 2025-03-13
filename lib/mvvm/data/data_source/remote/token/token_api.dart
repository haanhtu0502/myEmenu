import 'package:dio/dio.dart';
import 'package:emenu/mvvm/data/model/response/get_token_response/get_token_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'token_api.g.dart';

@RestApi()
@injectable
abstract class TokenApi {
  static const String branch = '/app/api/v1';
  static const String getTokensApi = '$branch/authenticate';

  @factoryMethod
  factory TokenApi(Dio dio) = _TokenApi;

  @POST(getTokensApi)
  Future<HttpResponse<GetTokenResponse>> getTokens(
      {@Body() required Map<String, dynamic> body});
}
