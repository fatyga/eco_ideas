import 'package:eco_ideas/common/widgets/auth_forms_fields/about_me_field.dart';
import 'package:eco_ideas/features/user/presentation/modify_my_profile/modify_my_profile_controller/modify_my_profile_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModifyMyProfileAboutMeField extends ConsumerWidget {
  const ModifyMyProfileAboutMeField({
    this.focusNode,
    super.key,
  });

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final inputState = ref.watch(
      modifyMyProfileControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.aboutMeInput,
      ),
    );
    final isLoading = ref.watch(
      modifyMyProfileControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );
    return AboutMeField(
      enabled: !isLoading,
      focusNode: focusNode,
      onChanged: ref
          .read(modifyMyProfileControllerProvider.notifier)
          .updateAboutMeInput,
      errorText: inputState == null
          ? null
          : inputState.isPure
              ? null
              : inputState.isNotValid
                  ? inputState.error!.errorText(l10n)
                  : null,
    );
  }
}
