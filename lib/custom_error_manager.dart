import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import 'custom_error.dart';

/// A class for managing dialogs based on CustomError instances.
class CustomErrorManager {
  /// Shows a dialog if an error exists in the `customError` object.
  ///
  /// This method displays an NAlertDialog with the provided `title`, `message`,
  /// and `actions` when an error is detected in the `customError` object.
  /// If `message` is not provided, it uses the error message from `customError`.
  static void showDialogIfError(
    BuildContext context, 
    CustomError customError, 
    String title, 
    String? message, 
    List<Widget>? actions
    ){

    String dialogMsg = message ?? customError.getError();

    if (customError.hasAnError()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NAlertDialog(
            dialogStyle: DialogStyle(titleDivider: true),
            title: Text(title),
            content: Text(dialogMsg),
            actions: actions,
          );
        },
      );
    }
  }

  /// Shows a SnackBar if an error exists in the `customError` object.
  ///
  /// This method displays a SnackBar with the error message from the `customError` object.
  /// You can provide custom `backgroundColor` and `behavior` for the SnackBar.
  static void showSnackBarIfError(
      BuildContext context, 
      CustomError customError, {
      Color? backgroundColor, 
      SnackBarBehavior? behavior
      }) {
    if (customError.hasAnError()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(customError.getError()),
          behavior: behavior ?? SnackBarBehavior.fixed,
          backgroundColor: backgroundColor ?? Colors.black,
        ),
      );
    }
  }
}