import 'package:flutter/material.dart';
import 'package:lifestyle_hub/provider/provider_architecture.dart';

class SignupViewModel extends BaseViewModel {
   BuildContext? _context;

  BuildContext get context => _context!;

  void initialize(BuildContext context) {
    this._context = context;
    notifyListeners();
  }
}
