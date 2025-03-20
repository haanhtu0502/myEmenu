import 'package:dio/dio.dart';
import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/core/di/di.dart';
import 'package:emenu/mvvm/data/data_source/local/home_info_local_storage.dart';
import 'package:emenu/mvvm/data/request/get_token_request.dart';
import 'package:emenu/mvvm/repository/auth_repositories.dart';

class TokenInterceptor extends Interceptor {
  @override
  // ignore: deprecated_member_use
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.uri.toString().contains("auth") ||
        options.uri.toString().contains("getbyDomain")) {
      return handler.next(options);
    } else {
      String accessToken = CommonAppSettingPref.getAccessToken();
      if (accessToken.isEmpty) {
        final newToken = await getRemoteAccessToken();
        if (newToken.isNotEmpty) {
          CommonAppSettingPref.setAccessToken(newToken);
          accessToken = newToken;
        } else {
          return;
        }
      }
      options.headers["Authorization"] = "Bearer $accessToken";
      // options = await _updateRequest(options);
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  Future<String> getRemoteAccessToken() async {
    final result = await injector
        .get<AuthRepositories>()
        .getTokens(GetTokenRequest(
          userName: 'WebService',
          passWord: 'WebService',
          dTenantId:
              injector.get<HomeInfoLocalStorage>().getHomeInfo()?.tenantId ?? 0,
          dOrgId:
              injector.get<HomeInfoLocalStorage>().getHomeInfo()?.orgId ?? 0,
          language: SharedPreferencesService.getString("language") ?? "vi",
        ));
    if (result == null) return '';
    return result.jwtToken;
  }
}
