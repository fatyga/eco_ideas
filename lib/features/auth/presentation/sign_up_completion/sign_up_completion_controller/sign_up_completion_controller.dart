import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_controller/sign_up_completion_state.dart';
import 'package:eco_ideas/features/user/data/user_exception.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';
import 'package:eco_ideas/router/go_router_provider/go_router_provider.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_completion_controller.g.dart';

@riverpod
class SignUpCompletionController extends _$SignUpCompletionController {
  @override
  FutureOr<SignUpCompletionState> build() {
    return const SignUpCompletionState();
  }

  void updateAvatarInput(UserAvatar? userAvatar) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      state = AsyncValue.data(
        stateValue.copyWith(
          avatarInput: AvatarInput.dirty(value: userAvatar),
        ),
      );
    }
  }

  void updateAboutMeInput(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const input = AboutMeInput.pure();

        state = AsyncData<SignUpCompletionState>(
          stateValue.copyWith(aboutMeInput: input),
        );
      } else {
        final input = AboutMeInput.dirty(value: newValue);

        state = AsyncData<SignUpCompletionState>(
          stateValue.copyWith(aboutMeInput: input),
        );
      }
    }
  }

  Future<void> completeSignUp() async {
    final stateValue = state.valueOrNull;

    if (stateValue != null && stateValue.isValid) {
      state = const AsyncLoading<SignUpCompletionState>();

      try {
        final userProfile = ref.read(userProfileChangesProvider);
        await ref.read(userRepositoryProvider).completeSignUp(
              userProfile.requireValue,
              avatarPath: stateValue.avatarInput.value?.path,
              aboutMe: stateValue.aboutMeInput.value,
            );
        // TODO(fatyga): find a way to automatically go to HomeRoute
        ref.read(goRouterProvider).go(const HomeRoute().location);
      } on EIUserException catch (e) {
        state = AsyncError<SignUpCompletionState>(e, StackTrace.current);
      }

      state = AsyncData<SignUpCompletionState>(state.requireValue);
    }
  }
}
