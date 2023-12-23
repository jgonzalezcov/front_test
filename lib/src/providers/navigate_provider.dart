import 'package:flutter/foundation.dart';

class NavigateProvider with ChangeNotifier {
  String _viewScreen = 'home';
  String get getViewScreen => _viewScreen;
  void setStringValue(String value) {
    _viewScreen = value;
    notifyListeners();
  }
}
