import 'package:eco_ideas/features/user/presentation/modify_my_profile/widgets/modify_my_profile_form/modify_my_profile_form.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ModifyMyProfileScreen extends StatelessWidget {
  const ModifyMyProfileScreen({super.key});

  static const path = 'modifyMyProfile';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.modifyMyProfileAppBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: const [ModifyMyProfileForm()]),
      ),
    );
  }
}
