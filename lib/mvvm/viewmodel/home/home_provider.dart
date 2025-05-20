import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/mvvm/data/request/get_pos_order_request.dart';
import 'package:emenu/mvvm/data/request/get_request_order_request.dart';
import 'package:emenu/mvvm/data/request/get_token_request.dart';
import 'package:emenu/mvvm/repository/auth_repositories.dart';
import 'package:emenu/mvvm/repository/emenu_config_repositories.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:emenu/mvvm/viewmodel/home/view_state/home_view_state.dart';
import 'package:emenu/mvvm/viewmodel/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeProvider extends ChangeNotifier {
  String? customerName;
  String? customerPhone;
  String? hashParam;
  final AuthRepositories _authRepositories;
  final EmenuConfigRepositories _emenuConfigRepositories;
  final LoginProvider _loginProvider;

  HomeViewState _state = const HomeViewState.idle();
  HomeViewState get state => _state;

  HomeProvider(
    @factoryParam this.hashParam,
    this._authRepositories,
    this._emenuConfigRepositories,
    this._loginProvider,
  ) {
    hashParam = hashParam;
    initData();
  }

  void initData() async {
    await getAppInfo();
    await getToken();
    await getCustomerInformation();
    notifyListeners();
  }

  Future<void> getCustomerInformation() async {
    final result = await _emenuConfigRepositories.getRequestOrder(
        request: GetRequestOrderRequest(
      page: 0,
      pageSize: 1,
      tableId: AppInformation().tableId ?? 0,
      floorId: AppInformation().floorId ?? 0,
    ));
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data.isNotEmpty) {
          _loginProvider.setCustomerName(r.data.first.customer?.name ?? '');
          _loginProvider.setCustomerPhone(r.data.first.customer?.phone1 ?? '');
          _state = const HomeViewState.getCustomerInfomationSuccess();
          notifyListeners();
        } else {
          getPosOrderCus();
        }
      },
    );
  }

  Future<void> getPosOrderCus() async {
    final result = await _emenuConfigRepositories.getPosOrder(
      request: GetPosOrderRequest(
        page: 0,
        pageSize: 1,
        tableId: AppInformation().tableId ?? 0,
        floorId: AppInformation().floorId ?? 0,
      ),
    );
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data.isNotEmpty) {
          _loginProvider.setCustomerName(r.data.first.customerName ?? '');
          _loginProvider.setCustomerPhone(r.data.first.phone ?? '');
          _state = const HomeViewState.getCustomerInfomationSuccess();
          notifyListeners();
        }
      },
    );
  }

  Future<void> getAppInfo() async {
    final appInfo = AppInformation();
    if (appInfo.isInitialized() || hashParam == null) {
      return;
    }
    final result = await _emenuConfigRepositories.getParams(
      queries: {
        "param": hashParam,
      },
    );
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data == null) {
          _state = HomeViewState.error(r.message);
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
          _state = HomeViewState.success(r.message);
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
      _state = const HomeViewState.error("Lấy token thất bại");
      notifyListeners();

      return;
    }
    CommonAppSettingPref.setAccessToken(result.jwtToken);
    _state = const HomeViewState.success("Lấy token thành công");

    notifyListeners();
  }
}
