import 'package:flutter/material.dart';

class AuthProviderButton extends StatelessWidget {
  const AuthProviderButton({
    required this.label,
    required this.logoAssetPath,
    required this.onPressed,
    super.key,
  });

  final String label;
  final String logoAssetPath;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton.icon(
      icon: Image.asset(logoAssetPath, height: 24),
      label: Text(
        label,
        style: theme.textTheme.titleSmall!
            .copyWith(color: theme.colorScheme.onSurface),
      ),
      onPressed: onPressed,
    );
  }
}
