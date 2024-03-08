import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Utils {
  void showSuccessToast(String title, BuildContext context) {
    toastification.show(
      context: context,
      title: Text(title),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      dismissDirection: DismissDirection.startToEnd,
      dragToClose: true,
      closeOnClick: true,
      pauseOnHover: true,
    );
  }

  void showErrorToast(String title, BuildContext context) {
    toastification.show(
      context: context,
      title: Text(title),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      dismissDirection: DismissDirection.startToEnd,
      dragToClose: true,
      closeOnClick: true,
      pauseOnHover: true,
    );
  }

  void showWarningToast(String title, BuildContext context) {
    toastification.show(
      context: context,
      title: Text(title),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      dismissDirection: DismissDirection.startToEnd,
      dragToClose: true,
      closeOnClick: true,
      pauseOnHover: true,
    );
  }
}
