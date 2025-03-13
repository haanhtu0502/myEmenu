import 'package:emenu/mvvm/data/data_source/remote/token/token_api.dart';
import 'package:emenu/mvvm/data/model/response/get_token_response/get_token_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepositories {
  final TokenApi _tokenApi;

  AuthRepositories(this._tokenApi);

  Future<GetTokenResponse> getTokens(Map<String, dynamic> body) async {
    final result = await _tokenApi.getTokens(body: body);
    return result.data;
  }
}
