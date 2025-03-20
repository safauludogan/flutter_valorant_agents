import 'package:common/src/toast/abstract/i_toast_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Toast Manager
class ToastManager extends IToastService {
  @override
  void showSuccessMessage({required String message}) {
    _showToast(message: message, color: const Color(0xFF4CAF50));
  }

  @override
  void showErrorMessage({required String message}) {
    _showToast(message: message, color: const Color(0xFFF44336));
  }

  @override
  void showInfoMessage({required String message}) {
    _showToast(message: message, color: const Color(0xFF2196F3));
  }

  void _showToast({required String message, required Color color}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
