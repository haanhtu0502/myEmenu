import 'dart:async';

import 'package:emenu/core/services/share_preferences_service.dart';
import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/model/org_emenu/org_emenu_model.dart';
import 'package:emenu/mvvm/data/request/get_pos_order_request.dart';
import 'package:emenu/mvvm/data/request/get_request_order_request.dart';
import 'package:emenu/mvvm/data/request/get_token_request.dart';
import 'package:emenu/mvvm/data/request/product_category/get_category_request.dart';
import 'package:emenu/mvvm/data/request/send_notification_request.dart';
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
  OrgEmenuModel? orgEmenuModel;

  List<CategoryModel> categories = [];

  final AuthRepositories _authRepositories;
  final EmenuConfigRepositories _emenuConfigRepositories;
  final ProductCategoryRepositories _productCategoryRepositories;

  HomeViewState _state = const HomeViewState.loadingInitial();
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

    Future.wait([
      getCustomerInformation(),
      getOrgEmenu(),
      getTableById(AppInformation().tableId.toString()),
    ]).then((p0) {
      _state = const HomeViewState.initialSuccess();
      getCategory();
      notifyListeners();
    }).catchError((error) {
      _state = HomeViewState.error(error.toString());
      notifyListeners();
    });
  }

  void resetState() {
    _state = const HomeViewState.idle();
    notifyListeners();
  }

  Future<void> getCustomerInformation() async {
    final result = await _emenuConfigRepositories.getRequestOrder(
        request: GetRequestOrderRequest(
      page: 0,
      pageSize: 1,
      tableId: AppInformation().tableId ?? 0,
      floorId: AppInformation().floorId ?? 0,
      orgId: AppInformation().orgId ?? 0,
    ));
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data.isNotEmpty) {
          _appProvider.setCustomerName(r.data.first.customer?.name ?? '');
          _appProvider.setCustomerPhone(r.data.first.customer?.phone1 ?? '');

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
        orgId: AppInformation().orgId ?? 0,
      ),
    );
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data.isNotEmpty &&
            _appProvider.customerName == null &&
            _appProvider.customerPhone == null) {
          _appProvider.setCustomerName(r.data.first.customerName ?? '');
          _appProvider.setCustomerPhone(r.data.first.phone ?? '');

          notifyListeners();
        }
        AppInformation().updateData(
          posOrderId: r.data.isNotEmpty ? r.data.first.id : null,
        );
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

  Future<void> getOrgEmenu() async {
    final result = await _emenuConfigRepositories.getOrgEmenu(
      orgId: AppInformation().orgId ?? 0,
    );
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data == null) {
          _state = HomeViewState.error(r.message);
        } else {
          orgEmenuModel = r.data;
          if (AppInformation().address == null ||
              AppInformation().address!.isEmpty) {
            AppInformation().updateData(
              address: r.data!.address,
            );
          }
          if (AppInformation().orgName == null ||
              AppInformation().orgName!.isEmpty) {
            AppInformation().updateData(
              orgName: r.data!.name,
            );
          }
        }
      },
    );
    notifyListeners();
  }

  Future<void> getTableById(String id) async {
    final result = await _emenuConfigRepositories.getTableById(id: id);
    result.fold(
      (l) => _state = HomeViewState.error(l.message),
      (r) {
        if (r.data == null) {
          _state = HomeViewState.error(r.message);
        } else {
          AppInformation().updateData(
            tableName: r.data!.name,
          );
        }
      },
    );
    notifyListeners();
  }

  Future<void> sendNotification({required String notifyType}) async {
    _state = const HomeViewState.loadingSendNotification();
    notifyListeners();
    if (notifyType == "RQ_PAYMENT" && AppInformation().posOrderId == null) {
      final result = await _emenuConfigRepositories.getPosOrder(
        request: GetPosOrderRequest(
          page: 0,
          pageSize: 1,
          tableId: AppInformation().tableId ?? 0,
          floorId: AppInformation().floorId ?? 0,
          orgId: AppInformation().orgId ?? 0,
        ),
      );
      if (result.isLeft()) {
        _state = HomeViewState.error(result.fold((l) => l.message, (_) => ''));
        notifyListeners();
        return;
      }

      final r = result.fold((_) => null, (right) => right)!;
      if (r.data.isNotEmpty && r.data.first.id == null) {
        _state =
            const HomeViewState.error("Không có đơn hàng nào để thanh toán");
        notifyListeners();
        return;
      }

      AppInformation().updateData(posOrderId: r.data.first.id);
    }

    final SendNotificationRequest queries = SendNotificationRequest(
      orgId: AppInformation().orgId ?? 0,
      posTerminalId: AppInformation().posTerminalId ?? 0,
      tableId: AppInformation().tableId ?? 0,
      floorId: AppInformation().floorId ?? 0,
      posOrderId: AppInformation().posOrderId,
      notifyType: notifyType,
    );
    final result = await _emenuConfigRepositories.sendNotification(rq: queries);
    result.fold(
      (l) {
        _state = HomeViewState.error(l.message);
        notifyListeners();
      },
      (r) {
        _state = HomeViewState.sendNotificationSuccess(r.message);
        notifyListeners();
      },
    );
  }

  bool get isLoading => _state.isLoadingInitial;
}
