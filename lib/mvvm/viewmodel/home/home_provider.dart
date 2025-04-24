import 'package:emenu/core/networking/view_state.dart';
import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/mvvm/data/request/get_token_request.dart';
import 'package:emenu/mvvm/repository/auth_repositories.dart';
import 'package:emenu/mvvm/repository/emenu_config_repositories.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeProvider extends ChangeNotifier {
  String? customerName;
  String? customerPhone;
  String? hashParam;
  final AuthRepositories _authRepositories;
  final EmenuConfigRepositories _emenuConfigRepositories;

  ViewState _state = const ViewState.idle();
  ViewState get state => _state;

  HomeProvider(
    @factoryParam this.hashParam,
    this._authRepositories,
    this._emenuConfigRepositories,
  ) {
    hashParam = hashParam;
    initData();
  }

  void initData() async {
    // Initialize data here if needed
    print(AppInformation().toString());
    await getAppInfo();
    await getToken();
    notifyListeners();
  }

  void setCustomerName(String name) {
    customerName = name;
    notifyListeners();
  }

  void setCustomerPhone(String phone) {
    customerPhone = phone;
    notifyListeners();
  }

  Future<void> getAppInfo() async {
    print("getAppInfo: start");
    final appInfo = AppInformation();
    if (appInfo.isInitialized() || hashParam == null) {
      return;
    }
    final result = await _emenuConfigRepositories.getParams(
      queries: {
        "param": hashParam,
      },
    );
    print("getAppInfo: ${result.toString()}");
    result.fold(
      (l) => _state = ViewState.error(l.message),
      (r) {
        if (r.data == null) {
          _state = ViewState.error(r.message);
        } else {
          AppInformation().updateData(
            tenantId: r.data!.tenantId,
            orgId: r.data!.orgId,
            posTerminalId: r.data!.posTerminalId,
            floorId: r.data!.floorId,
            tableId: r.data!.tableId,
            tableNo: r.data!.tableNo,
            floorNo: r.data!.floorNo,
            priceListId: r.data!.priceListId,
          );
          _state = ViewState.success(r.message);
        }
      },
    );
    notifyListeners();
  }

  Future<void> getToken() async {
    print("getToken: start");
    final result = await _authRepositories.getTokens(
      GetTokenRequest(
        userName: 'WebService',
        passWord: 'WebService',
        dTenantId: AppInformation().tenantId ?? 0,
        dOrgId: AppInformation().orgId ?? 0,
        language: 'vi',
      ),
    );
    if (result == null) {
      // Handle error case
      _state = const ViewState.error("Lấy token thất bại");
      notifyListeners();

      return;
    }
    CommonAppSettingPref.setAccessToken(result.jwtToken);
    _state = const ViewState.success("Lấy token thành công");

    notifyListeners();
  }
}
