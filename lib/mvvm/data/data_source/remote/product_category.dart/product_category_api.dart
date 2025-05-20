import 'package:dio/dio.dart';
import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'product_category_api.g.dart';

@RestApi()
@injectable
abstract class ProductCategoryApi {
  static const String branchv1 = '/app/api/v1';
  static const String getCategoryApi = '$branchv1/eRequest/getProductCategory';

  @factoryMethod
  factory ProductCategoryApi(Dio dio) = _ProductCategoryApi;

  @GET(getCategoryApi)
  Future<HttpResponse<ResponseData<List<CategoryModel>>>> getCategory(
      {@Queries(encoded: true) required Map<String, dynamic> queries});
}
