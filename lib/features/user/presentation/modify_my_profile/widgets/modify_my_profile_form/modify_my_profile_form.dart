import 'package:eco_ideas/features/user/presentation/modify_my_profile/widgets/modify_my_profile_form/modify_my_profile_about_me_field.dart';
import 'package:eco_ideas/features/user/presentation/modify_my_profile/widgets/modify_my_profile_form/modify_my_profile_user_avatar.dart';
import 'package:flutter/material.dart';

class ModifyMyProfileForm extends StatelessWidget {
  const ModifyMyProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [ModifyMyProfileUserAvatar(), ModifyMyProfileAboutMeField()],
    );
  }
}
