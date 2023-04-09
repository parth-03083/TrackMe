import 'package:ace_hack/services/user_services.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final _service = UserService();
  List<User> _user = [];
  List<User> get user => _user;
  bool isLoading = false;

  Future<void> getAllUser() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _user = response;
    isLoading = false;
    notifyListeners();
  }
}
