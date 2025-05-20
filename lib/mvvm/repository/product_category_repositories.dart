import 'package:emenu/core/networking/s_result.dart';
import 'package:emenu/mvvm/data/api_call_helper.dart';
import 'package:emenu/mvvm/data/data_source/remote/product_category.dart/product_category_api.dart';
import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:emenu/mvvm/data/request/product_category/get_category_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCategoryRepositories extends ApiCallHelper {
  final ProductCategoryApi _productCategoryApi;

  ProductCategoryRepositories(this._productCategoryApi);

  Future<SResult<ResponseData<List<CategoryModel>>>> getCategory(
      {required GetCategoryRequest request}) async {
    return await apiCall<ResponseData<List<CategoryModel>>,
            ResponseData<List<CategoryModel>>>(
        mapper: (p0) => p0,
        request: () async =>
            await _productCategoryApi.getCategory(queries: request.toMap()));
  }
}
