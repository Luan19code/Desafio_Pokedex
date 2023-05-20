import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MySnackbarService {
  void showSnackbar(String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(GetIt.I.get<BuildContext>()).showSnackBar(snackbar);
  }
}
