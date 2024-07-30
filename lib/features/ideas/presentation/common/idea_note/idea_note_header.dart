import 'package:flutter/material.dart';

class IdeaNoteHeader extends StatelessWidget {
  const IdeaNoteHeader({
    required this.icon,
    required this.text,
    required this.onAddIconTap,
    super.key,
  });

  final Widget icon;
  final String text;
  final VoidCallback onAddIconTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.info_outline, size: 16),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(
          onPressed: onAddIconTap,
          icon: const Icon(Icons.add, size: 20),
        ),
      ],
    );
  }
}
