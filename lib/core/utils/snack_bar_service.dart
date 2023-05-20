import 'package:desafio_snapfi/core/components/custom_text.dart';
import 'package:desafio_snapfi/core/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class SnackbarService {
  final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;

  void showSnackbar(String message) {
    _messengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: CustomColors.background,
        content: CustomText(
          textAlign: TextAlign.center,
          fontColor: CustomColors.danger,
          description: message,
          variant: CustomTextVariant.variant1,
          fontSize: 12,
        ),
      ),
    );
  }
}
