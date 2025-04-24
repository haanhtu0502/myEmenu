import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginProvider extends ChangeNotifier {
  String? username;
  String? phoneNumber;

  LoginProvider();
}
