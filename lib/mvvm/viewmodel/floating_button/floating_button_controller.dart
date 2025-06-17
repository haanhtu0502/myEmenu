import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class FloatingButtonController extends ChangeNotifier {
  double? _positionTop;
  double? _positionLeft;

  double? get positionTop => _positionTop;
  double? get positionLeft => _positionLeft;

  FloatingButtonController();

  void changeButtonPosition(
      {double? top, double? left, bool isUpdateUi = true}) {
    _positionTop = top ?? _positionTop;
    _positionLeft = left ?? _positionLeft;
    if (isUpdateUi) {
      notifyListeners();
    }
  }
}
