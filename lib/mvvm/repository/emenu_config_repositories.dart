import 'package:emenu/core/networking/s_result.dart';
import 'package:emenu/mvvm/data/api_call_helper.dart';
import 'package:emenu/mvvm/data/data_source/remote/config/emenu_config_api.dart';
import 'package:emenu/mvvm/data/model/emenu_param/emenu_param.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
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
}
