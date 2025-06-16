import 'package:dio/dio.dart';
import 'package:emenu/mvvm/data/model/emenu_param/emenu_param.dart';
import 'package:emenu/mvvm/data/model/org_emenu/org_emenu_model.dart';
import 'package:emenu/mvvm/data/model/organization/organization_model.dart';
import 'package:emenu/mvvm/data/model/pos_order/pos_order_model.dart';
import 'package:emenu/mvvm/data/model/request_order/request_order_model.dart';
import 'package:emenu/mvvm/data/model/response/pagination_response/pagination_response_model.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'emenu_config_api.g.dart';

@RestApi()
@injectable
abstract class EmenuConfigApi {
  static const String branch = '/app/api/v2';
  static const String branchv1 = '/app/api/v1';
  static const String getParamsApi = '$branch/config/getParam';
  static const String getRequestOrderApi = '$branchv1/requestOrder/findAll';
  static const String getPosOrderApi = '$branchv1/posOrders/findAll';
  static const String getOrgEmenuApi = '$branchv1/org/getOrgEmenu';
  static const String getTableByIdApi = '$branchv1/tables';

  @factoryMethod
  factory EmenuConfigApi(Dio dio) = _EmenuConfigApi;

  @GET(getParamsApi)
  Future<HttpResponse<ResponseData<EmenuParam>>> getParams(
      {@Queries(encoded: true) required Map<String, dynamic> queries});

  @GET(getRequestOrderApi)
  Future<HttpResponse<PaginationResponse<RequestOrderModel>>> getRequestOrder(
      {@Queries(encoded: true) required Map<String, dynamic> queries});

  @GET(getPosOrderApi)
  Future<HttpResponse<PaginationResponse<PosOrderModel>>> getPosOrder(
      {@Queries(encoded: true) required Map<String, dynamic> queries});

  @GET(getOrgEmenuApi)
  Future<HttpResponse<ResponseData<OrgEmenuModel>>> getOrgEmenu(
      {@Queries(encoded: true) required Map<String, dynamic> queries});

  @GET('$getTableByIdApi/{id}')
  Future<HttpResponse<ResponseData<OrganizationModel>>> getTableById(
      @Path('id') String id);
}
