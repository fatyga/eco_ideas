import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileForm extends ConsumerStatefulWidget {
  const UserProfileForm({required this.userProfile, super.key});

  final UserProfile userProfile;

  @override
  ConsumerState<UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends ConsumerState<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();

  XFile? image;
  late final TextEditingController _fullNameField;
  late final TextEditingController _usernameField;
  late final TextEditingController _bioField;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate();

    final changedValues = <String, dynamic>{};

    if (isValid != null && isValid) {
      _formKey.currentState!.save();
      if (_fullNameField.text != widget.userProfile.fullName) {
        changedValues[ProfileTable.fullName] = _fullNameField.text;
      }

      if (_usernameField.text != widget.userProfile.username) {
        changedValues[ProfileTable.username] = _usernameField.text;
      }

      if (_bioField.text != widget.userProfile.bio) {
        changedValues[ProfileTable.bio] = _bioField.text;
      }

      if (changedValues.isNotEmpty) {
        await ref
            .read(editUserProfileControllerProvider.notifier)
            .updateUserProfile(widget.userProfile.id, changedValues);
      }
      if (image != null) {
        await ref
            .read(editUserProfileControllerProvider.notifier)
            .uploadAvatar(widget.userProfile.id, image!);
      }
      // Force currentUserProfileProvider to obtain updated user profile
      ref.invalidate(currentUserProfileProvider);
    }
  }

  @override
  void initState() {
    super.initState();
    _fullNameField = TextEditingController(text: widget.userProfile.fullName);
    _usernameField = TextEditingController(text: widget.userProfile.username);
    _bioField = TextEditingController(text: widget.userProfile.bio);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Center(
            child: AvatarField(
              currentAvatarUrl: widget.userProfile.avatarUrl,
              // TODO(fatyga): change the way how avatar is saved
              onSaved: (file) {
                setState(() {
                  image = file;
                });
              },
            ),
          ),
          context.spaces.verticalLarge,
          FullNameField(
            controller: _fullNameField,
          ),
          UsernameField(
            controller: _usernameField,
          ),
          BioField(
            controller: _bioField,
          ),
          // TODO(fatyga): replace it with FAB in EditUserProfileScreen
          FilledButton(onPressed: _submit, child: const Text('Save')),
        ],
      ),
    );
  }
}
