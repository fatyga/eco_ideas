import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class RestrictedPasswordField extends StatelessWidget {
  const RestrictedPasswordField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  // TODO(fatyga): add the rest of requirements
  String? validator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.requiredField;
    } else if (value.length < 8) {
      return l10n.tooShortPassword;
    } else if (!RegExp('[0-9]').hasMatch(value)) {
      return l10n.digitIsRequired;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        TextFormField(
          controller: controller,
          validator: (value) => validator(value, l10n),
          decoration: InputDecoration(
            labelText: l10n.password,
            helperText: '',
          ),
          obscureText: true,
        ),
        // Flexible(child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Row(children: [
        //         Icon(Icons.check_box_outlined),
        //         context.spaces.horizontalStandard,
        //         Text('At least 8 characters')
        //       ]),
        //       Row(children: [
        //         Icon(Icons.check_box_outlined),
        //         context.spaces.horizontalStandard,
        //         Text('At least 8 characters')
        //       ]),
        //       Row(children: [
        //         Icon(Icons.check_box_outlined),
        //         context.spaces.horizontalStandard,
        //         Text('At least 8 characters')
        //       ])
        //     ]
        // )),
      ],
    );
  }
}
