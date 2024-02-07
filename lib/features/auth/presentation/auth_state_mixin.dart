import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure_ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

mixin AuthStateSnackBarOnErrorMixin {}

extension AuthStateSnackBarOnError
    on AsyncValue<AuthStateSnackBarOnErrorMixin> {
  void showSnackBarOnError(BuildContext context) => whenOrNull<void>(
        error: (error, __) {
          if (error is AuthFailure) {
            final errorText = error.resloveErrorMessageForUser(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorText)));
          }
        },
      );
}
