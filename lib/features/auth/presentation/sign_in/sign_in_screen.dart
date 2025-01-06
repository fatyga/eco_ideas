import 'package:eco_ideas/app_logo.dart';
import 'package:eco_ideas/features/auth/auth.dart';

import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

// TODO(fatyga): simplify layout
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddings.allLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            context.spaces.verticalLarge,
            const AppLogo(),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(child: EmailSignInForm()),
                  Padding(
                    padding: context.paddings.verticalLarge * 2,
                    child: const SignInMethods(),
                  ),
                  const SignInScreenFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
