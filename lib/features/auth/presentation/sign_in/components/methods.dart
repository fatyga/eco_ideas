import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

// TODO(fatyga): change name of this widget to more meaningful
// TODO(fatyga): add icons with right dimensions
class SignInMethods extends StatelessWidget {
  const SignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.signInMethods_hint),
        context.spaces.horizontalStandard,
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/google_icon.png', width: 24, height: 24),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/facebook_icon.png', width: 24, height: 24),
        ),
      ],
    );
  }
}
