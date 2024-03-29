import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension SnackbarOnError<T> on AsyncValue<T> {
  void showSnackBarOnError(BuildContext context) => whenOrNull<void>(
        error: (error, __) {
          if (error is EIException) {
            final l10n = context.l10n;
            final errorText = error.resolveMessageForUser(l10n);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorText)));
          }
        },
      );
}
