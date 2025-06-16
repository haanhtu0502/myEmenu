import 'package:emenu/core/networking/s_result.dart';
import 'package:emenu/mvvm/data/api_call_helper.dart';
import 'package:emenu/mvvm/data/data_source/remote/config/emenu_config_api.dart';
import 'package:emenu/mvvm/data/model/emenu_param/emenu_param.dart';
import 'package:emenu/mvvm/data/model/org_emenu/org_emenu_model.dart';
import 'package:emenu/mvvm/data/model/pos_order/pos_order_model.dart';
import 'package:emenu/mvvm/data/model/request_order/request_order_model.dart';
import 'package:emenu/mvvm/data/model/response/pagination_response/pagination_response_model.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:emenu/mvvm/data/request/get_pos_order_request.dart';
import 'package:emenu/mvvm/data/request/get_request_order_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmenuConfigRepositories extends ApiCallHelper {
  final EmenuConfigApi _emenuConfigApi;

  EmenuConfigRepositories(this._emenuConfigApi);

  Future<SResult<ResponseData<EmenuParam>>> getParams(
      {required Map<String, dynamic> queries}) async {
    return await apiCall<ResponseData<EmenuParam>, ResponseData<EmenuParam>>(
        mapper: (p0) => p0,
        request: () async => await _emenuConfigApi.getParams(queries: queries));
  }

  Future<SResult<PaginationResponse<RequestOrderModel>>> getRequestOrder(
      {required GetRequestOrderRequest request}) async {
    return await apiCall<PaginationResponse<RequestOrderModel>,
            PaginationResponse<RequestOrderModel>>(
        mapper: (p0) => p0,
        request: () async =>
            await _emenuConfigApi.getRequestOrder(queries: request.toMap()));
  }

  Future<SResult<PaginationResponse<PosOrderModel>>> getPosOrder(
      {required GetPosOrderRequest request}) async {
    return await apiCall<PaginationResponse<PosOrderModel>,
            PaginationResponse<PosOrderModel>>(
        mapper: (p0) => p0,
        request: () async =>
            await _emenuConfigApi.getPosOrder(queries: request.toMap()));
  }

  Future<SResult<ResponseData<OrgEmenuModel>>> getOrgEmenu(
      {required int orgId}) async {
    return await apiCall<ResponseData<OrgEmenuModel>,
        ResponseData<OrgEmenuModel>>(
      mapper: (p0) => p0,
      request: () async => await _emenuConfigApi.getOrgEmenu(
        queries: {
          'orgId': orgId,
        },
      ),
    );
  }
}
