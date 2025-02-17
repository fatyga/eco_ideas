import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileEditor extends ConsumerStatefulWidget {
  const UserProfileEditor({super.key});

  @override
  ConsumerState<UserProfileEditor> createState() => _UserProfileEditorState();
}

class _UserProfileEditorState extends ConsumerState<UserProfileEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(currentUserProfileProvider).requireValue;
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.editYourProfile)),
      body: Padding(
        padding: context.paddings.allLarge,
        child: UserProfileForm(
          formKey: _formKey,
          initialUserProfile: userProfile,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}
