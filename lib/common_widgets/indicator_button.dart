import 'package:flutter/material.dart';

class IndicatorButton extends StatelessWidget {
  const IndicatorButton({
    required this.isLoading,
    required this.onPressed,
    required this.child,
    super.key,
  });

  final bool isLoading;
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: isLoading ? const CircularProgressIndicator() : child,
    );
  }
}
