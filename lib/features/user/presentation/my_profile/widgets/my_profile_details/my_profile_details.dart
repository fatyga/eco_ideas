import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/widgets/my_profile_details/my_profile_field.dart';
import 'package:flutter/material.dart';

class MyProfileDetails extends StatelessWidget {
  const MyProfileDetails(this.userProfile, {super.key});

  final UserProfile userProfile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          MyProfileField('Username', userProfile.username),
          if (userProfile.aboutMe != null)
            MyProfileField('About me', userProfile.aboutMe!),
        ],
      ),
    );
  }
}
