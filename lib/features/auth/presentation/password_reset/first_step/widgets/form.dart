import 'package:eco_ideas/common/extensions/snackbar_on_error.dart';
import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/presentation/form_fields/email_field.dart';
import 'package:eco_ideas/features/auth/presentation/presentation.dart';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetEmailForm extends ConsumerStatefulWidget {
  const PasswordResetEmailForm({required this.onSubmit, super.key});

  final VoidCallback onSubmit;
  @override
  ConsumerState<PasswordResetEmailForm> createState() =>
      _PasswordResetEmailFormState();
}

class _PasswordResetEmailFormState
    extends ConsumerState<PasswordResetEmailForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.read(
      passwordResetFirstStepControllerProvider
          .select((state) => state.isLoading),
    );

    ref.listen(
      passwordResetFirstStepControllerProvider,
      (_, next) => next.showSnackBarOnError(context),
    );

    final l10n = context.l10n;
    return FormBuilder(
      key: _formKey,
      enabled: !isLoading,
      child: Column(
        children: [
          Text(l10n.passwordResetFirstStepDescription),
          const SizedBox(height: 8),
          const EmailField(),
          const SizedBox(height: 12),
          PrimaryButton(
            isLoading: isLoading,
            onPressed: () async {
              final isValid = _formKey.currentState?.saveAndValidate();

              if (isValid != null && isValid) {
                final success = await ref
                    .read(passwordResetFirstStepControllerProvider.notifier)
                    .submit(
                      _formKey.currentState!.fields['email']!.value as String,
                    );
                if (success) widget.onSubmit();
              }
            },
            child: Text(l10n.signInButtonText),
          ),
        ],
      ),
    );
  }
}
