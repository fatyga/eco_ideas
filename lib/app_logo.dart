import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/app_icon.png'),
        context.spaces.verticalStandard,
        Text(l10n.appName, style: theme.textTheme.headlineMedium),
      ],
    );
  }
}
