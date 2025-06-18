import 'package:emenu/core/networking/s_result.dart';
import 'package:emenu/mvvm/data/api_call_helper.dart';
import 'package:emenu/mvvm/data/data_source/remote/request/request_api.dart';
import 'package:emenu/mvvm/data/model/request_history/request_history_model.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:emenu/mvvm/data/request/create_order_request.dart';
import 'package:emenu/mvvm/data/request/get_request_history_request.dart';
import 'package:emenu/mvvm/data/request/send_notify_remind_request.dart';
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

  Future<SResult<ResponseData<List<RequestHistoryModel>>>> getRequestHistory(
      GetRequestHistoryRequest request) async {
    final result = await callHandleResponseDataNoNullCheck<
        ResponseData<List<RequestHistoryModel>>,
        ResponseData<List<RequestHistoryModel>>>(
      mapper: (response) => response,
      request: () async =>
          await _requestApi.getRequestHistory(queries: request.toJson()),
    );
    return result;
  }

  Future<SResult<ResponseData>> sendNotifyRemind(
      SendNotifyRemindRequest request) async {
    final result =
        await callHandleResponseDataNoNullCheck<ResponseData, ResponseData>(
      mapper: (response) => response,
      request: () async =>
          await _requestApi.sendNotifyRemind(queries: request.toJson()),
    );
    return result;
  }
}
