import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginProvider extends ChangeNotifier {
  String? customerName;
  String? customerPhone;

  LoginProvider();

  void setCustomerName(String name) {
    customerName = name;
    notifyListeners();
  }

  void setCustomerPhone(String phone) {
    customerPhone = phone;
    notifyListeners();
  }

  bool get isLogin => customerName != null && customerPhone != null;
}
