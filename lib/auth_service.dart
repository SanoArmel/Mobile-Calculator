import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void signUp(String email, String password) {
    // Perform sign-up logic here
    // For example, you can store user data in local storage or make an API call
    // After successful sign-up, call notifyListeners()
    notifyListeners();
  }

  void signIn(String email, String password) {
    // Perform sign-in logic here
    // For example, you can validate user credentials
    // After successful sign-in, set _isAuthenticated to true and call notifyListeners()
    _isAuthenticated = true;
    notifyListeners();
  }
}

