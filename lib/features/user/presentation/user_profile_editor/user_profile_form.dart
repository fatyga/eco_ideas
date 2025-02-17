import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

class UserProfileForm extends StatefulWidget {
  const UserProfileForm(
      {required this.formKey, required this.initialUserProfile, super.key});

  final GlobalKey<FormState> formKey;
  final UserProfile initialUserProfile;

  @override
  State<UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Center(child: AvatarField()),
          context.spaces.verticalStandard,
          FullNameField(
            initialValue: widget.initialUserProfile.fullName,
          ),
          UsernameField(
            initialValue: widget.initialUserProfile.username,
          ),
          BioField(
            initialValue: widget.initialUserProfile.bio,
          ),
        ],
      ),
    );
  }
}
