import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaNotePointField extends StatelessWidget {
  const IdeaNotePointField({required this.content, super.key});

  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 6),
          const SizedBox(width: 8),
          Expanded(
            child: FormBuilderTextField(
              initialValue: content,
              maxLines: null,
              name: 'point',
            ),
          ),
        ],
      ),
    );
  }
}
