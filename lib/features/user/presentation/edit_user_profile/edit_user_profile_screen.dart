import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/async_value_extension.dart';
import 'package:eco_ideas/utils/loading_widget.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditUserProfileScreen extends ConsumerWidget {
  const EditUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(currentUserProfileProvider);
    final state = ref.watch(editUserProfileControllerProvider);

    ref.listen(
      editUserProfileControllerProvider,
      (_, current) => current.showSnackbarOnError(context),
    );

    final l10n = context.l10n;
    return LoadingFeedback(
      isLoading: state.isLoading,
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.editYourProfile)),
        body: Padding(
          padding: context.paddings.allLarge,
          child: UserProfileForm(
            // TODO(fatyga): make sure, that value is always present
            userProfile: userProfile.requireValue,
          ),
        ),
      ),
    );
  }
}
