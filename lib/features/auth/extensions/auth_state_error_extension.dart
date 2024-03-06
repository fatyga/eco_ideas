import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception_ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

extension AuthStateSnackBarOnError<T> on AsyncValue<T> {
  void showSnackBarOnError(BuildContext context) => whenOrNull<void>(
        error: (error, __) {
          if (error is EIAuthException) {
            final errorText = error.resloveErrorMessageForUser(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorText)));
          }
        },
      );
}
