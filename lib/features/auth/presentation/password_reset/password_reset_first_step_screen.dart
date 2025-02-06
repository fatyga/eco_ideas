import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/loading_widget.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:eco_ideas/utils/state_with_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Sends password reset request for given email
class PasswordResetFirstStepScreen extends ConsumerStatefulWidget {
  const PasswordResetFirstStepScreen({super.key});

  static const String routeName = 'passwordResetFirstStep';

  @override
  ConsumerState<PasswordResetFirstStepScreen> createState() =>
      _PasswordResetScreenState();
}

class _PasswordResetScreenState
    extends ConsumerState<PasswordResetFirstStepScreen>
    with LoadingFeedbackMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();

  AppLocalizations get l10n => context.l10n;

  // Indicates, whether password reset request was sent.
  bool _isRequestSend = false;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final email = _emailFieldController.text;

      setLoading(true);

      try {
        await ref
            .read(authRepositoryProvider)
            .resetPasswordForEmail(email: email);

        setState(() {
          _isRequestSend = true;
        });
      } on AuthException catch (e) {
        if (mounted) {
          handleAuthException(context, e);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l10n.unknown_exception)));
        }
      }

      setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingFeedback(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.resetYourPassword)),
        body: _isRequestSend
            ? const _RequestSentFeedback()
            : Padding(
                padding: context.paddings.allLarge,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(l10n.passwordResetFirstStep_description),
                      context.spaces.verticalLarge,
                      EmailField(controller: _emailFieldController),
                      context.spaces.verticalLarge,
                      FilledButton(
                        onPressed: _submit,
                        child: Text(l10n.confirm),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class _RequestSentFeedback extends StatelessWidget {
  const _RequestSentFeedback();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Padding(
      padding: context.paddings.allLarge,
      child: Column(
        children: [
          context.spaces.verticalLarge,
          // TODO(fatyga): set consistent size for icon
          const Icon(Icons.mark_email_read, size: 36),
          context.spaces.verticalLarge,
          Text(
            l10n.passwordResetLinkSent_title,
            style: theme.textTheme.headlineSmall,
          ),
          context.spaces.verticalStandard,
          Text(l10n.passwordResetLinkSent_description),
        ],
      ),
    );
  }
}
