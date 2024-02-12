import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/auth_state_mixin.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_completion_state.freezed.dart';

enum SignUpCompletionStateStatus { initial, completed }

@freezed
class SignUpCompletionState
    with _$SignUpCompletionState, AuthStateSnackBarOnErrorMixin {
  const factory SignUpCompletionState({
    @Default(SignUpCompletionStateStatus.initial)
    SignUpCompletionStateStatus status,
    @Default(AboutMeInput.pure()) AboutMeInput aboutMeInput,
    @Default(AvatarInput.pure()) AvatarInput avatarInput,
  }) = _SignUpCompletionState;
  const SignUpCompletionState._();

  bool get isCompleted => status == SignUpCompletionStateStatus.completed;
}

extension InputsValidty on SignUpCompletionState {
  bool get isValid => Formz.validate([aboutMeInput, avatarInput]);
}
