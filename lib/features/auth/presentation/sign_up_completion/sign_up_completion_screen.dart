import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_controller/sign_up_completion_controller.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/widgets/sign_up_completion_form/sign_up_completion_form.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/widgets/sign_up_completion_greeter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpCompletionScreen extends ConsumerWidget {
  const SignUpCompletionScreen({super.key});
  static const String path = 'signUpCompletion';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleted = ref.watch(
      signUpCompletionControllerProvider
          .select((state) => state.valueOrNull?.isCompleted),
    );

    return Scaffold(
      body: isCompleted != null && isCompleted
          ? const SignUpCompletionGreeter()
          : const SignUpCompletionForm(),
    );
  }
}
