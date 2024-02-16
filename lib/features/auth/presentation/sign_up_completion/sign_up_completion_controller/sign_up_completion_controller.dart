import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_controller/sign_up_completion_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_completion_controller.g.dart';

@riverpod
class SignUpCompletionController extends _$SignUpCompletionController {
  @override
  FutureOr<SignUpCompletionState> build() {
    return const SignUpCompletionState();
  }

  void updateAvatar(String? imageFilePath) {
    final stateValue = state.valueOrNull;
    if (imageFilePath != null &&
        imageFilePath.isNotEmpty &&
        stateValue != null) {
      state = AsyncValue.data(
        stateValue.copyWith(
          avatarInput: AvatarInput.dirty(value: imageFilePath),
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

      final userRepository = ref.read(userRepositoryProvider);
      try {
        await userRepository.uploadAvatar(
          imagePath: stateValue.avatarInput.value,
        );
      } catch (e) {
        state = AsyncError<SignUpCompletionState>(e, StackTrace.current);
      }
      state = AsyncData<SignUpCompletionState>(
        stateValue.copyWith(status: SignUpCompletionStateStatus.completed),
      );
    }
  }
}
