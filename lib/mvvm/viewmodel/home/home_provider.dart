import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/request/get_pos_order_request.dart';
import 'package:emenu/mvvm/data/request/get_request_order_request.dart';
import 'package:emenu/mvvm/data/request/get_token_request.dart';
import 'package:emenu/mvvm/data/request/product_category/get_category_request.dart';
import 'package:emenu/mvvm/repository/auth_repositories.dart';
import 'package:emenu/mvvm/repository/emenu_config_repositories.dart';
import 'package:emenu/mvvm/repository/product_category_repositories.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:emenu/mvvm/viewmodel/home/view_state/home_view_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeProvider extends ChangeNotifier {
  String? customerName;
  String? customerPhone;
  String? hashParam;

  List<CategoryModel> categories = [];

  final AuthRepositories _authRepositories;
  final EmenuConfigRepositories _emenuConfigRepositories;
  final ProductCategoryRepositories _productCategoryRepositories;

  HomeViewState _state = const HomeViewState.idle();
  HomeViewState get state => _state;
  final AppProvider _appProvider;

  HomeProvider(
    @factoryParam this.hashParam,
    @factoryParam this._appProvider,
    this._authRepositories,
    this._emenuConfigRepositories,
    this._productCategoryRepositories,
  ) {
    hashParam = hashParam;
  }

  void initData() async {
    if (!AppInformation().isInitialized()) {
      await getAppInfo();
      await getToken();
    }

    await getCustomerInformation();
  }

  Future<void> getCustomerInformation() async {
    if (_appProvider.isLogin) {
      _state = const HomeViewState.getCustomerInfomationSuccess();
      return;
    }
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
          _appProvider.setCustomerName(r.data.first.customer?.name ?? '');
          _appProvider.setCustomerPhone(r.data.first.customer?.phone1 ?? '');
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
          _appProvider.setCustomerName(r.data.first.customerName ?? '');
          _appProvider.setCustomerPhone(r.data.first.phone ?? '');
          _state = const HomeViewState.getCustomerInfomationSuccess();
          notifyListeners();
        }
      },
    );
  }

  Future<void> getAppInfo() async {
    if (hashParam == null) {
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
            orgName: r.data!.orgName,
            address: r.data!.address,
            hashParam: hashParam,
          );
        }
      },
    );
    notifyListeners();
  }

  Future<void> getToken() async {
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

    notifyListeners();
  }

  Future<void> getCategory() async {
    _state = const HomeViewState.loadingGetCategroy();
    notifyListeners();
    final result = await _productCategoryRepositories.getCategory(
      request: GetCategoryRequest(
        page: 0,
        pageSize: 100,
        tenantId: AppInformation().tenantId ?? 0,
        orgId: AppInformation().orgId ?? 0,
        posTerminalId: AppInformation().posTerminalId ?? 0,
        isMenu: 'Y',
      ),
    );
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data == null) {
          _state = HomeViewState.error(r.message);
        } else {
          _state = const HomeViewState.getCategorySuccess();
          categories = r.data!;
        }
      },
    );
    notifyListeners();
  }
}
