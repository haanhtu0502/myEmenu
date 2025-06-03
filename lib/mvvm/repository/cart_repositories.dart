import 'package:emenu/core/networking/s_result.dart';
import 'package:emenu/mvvm/data/api_call_helper.dart';
import 'package:emenu/mvvm/data/data_source/remote/request/request_api.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:emenu/mvvm/data/request/create_order_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartRepositories extends ApiCallHelper {
  final RequestApi _requestApi;
  CartRepositories(this._requestApi);

  Future<SResult<ResponseData>> saveRequestOrder(
      CreateOrderRequest request) async {
    final result =
        await callHandleResponseDataNoNullCheck<ResponseData, ResponseData>(
      mapper: (response) => response,
      request: () async =>
          await _requestApi.saveRequest(queries: request.toJson()),
    );
    return result;
  }
}
