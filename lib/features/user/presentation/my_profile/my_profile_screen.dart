import 'package:eco_ideas/features/user/presentation/my_profile/my_profile.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/widgets/sign_out_button.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static const path = 'myProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      const MyProfileUserAvatar(),
      const MyProfileSignOutButton()
    ]));
  }
}
