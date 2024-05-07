import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models/avatar_input.dart';
import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models/email_input.dart';

import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models/password_retype_input.dart';
import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models/restricted_password_input.dart';
import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models/username_input.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

enum SignUpStateStatus { initial, linkSent }

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(UsernameInput.pure()) UsernameInput usernameInput,
    @Default(EmailInput.pure()) EmailInput emailInput,
    @Default(RestrictedPasswordInput.pure())
    RestrictedPasswordInput passwordInput,
    @Default(PasswordRetypeInput.pure())
    PasswordRetypeInput passwordRetypeInput,
    @Default(AvatarInput.pure()) AvatarInput avatarInput,
    @Default(SignUpStateStatus.initial) SignUpStateStatus status,
  }) = _SignUpState;
  const SignUpState._();

  bool get isLinkSent => status == SignUpStateStatus.linkSent;
}

extension FieldsValidity on SignUpState {
  bool get isValid => Formz.validate(
        [
          usernameInput,
          emailInput,
          passwordInput,
          avatarInput,
          passwordRetypeInput,
        ],
      );
}
