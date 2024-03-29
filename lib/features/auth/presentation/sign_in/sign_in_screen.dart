import 'package:eco_ideas/common/widgets/greeting_title.dart';
import 'package:eco_ideas/common/widgets/labeled_divider.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const path = 'signIn';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  bool get isAnyFieldFocused =>
      _emailFocusNode.hasFocus || _passwordFocusNode.hasFocus;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    _emailFocusNode.addListener(() => setState(() {}));
    _passwordFocusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const Spacer(),
            const GreetingTitle(),
            const SizedBox(height: 64),
            SignInForm(
              emailFocusNode: _emailFocusNode,
              passwordFocusNode: _passwordFocusNode,
            ),
            if (!isAnyFieldFocused) ...[
              LabeledDivider(
                labelText: l10n.signInLabeledDividerText,
                verticalSpace: 20,
              ),
              const GoogleAuthButton(),
              const Spacer(),
              const Center(
                child: RegisterActionButton(),
              ),
            ] else
              const Spacer(),
          ],
        ),
      ),
    );
  }
}
