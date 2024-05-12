part of 'ei_form_model.dart';

class SignUpCompletionForm extends EIFormModel {
  SignUpCompletionForm(
      {this.avatarInput = const AvatarInput.pure(),
      this.aboutMeInput = const AboutMeInput.pure()});

  final AvatarInput avatarInput;
  final AboutMeInput aboutMeInput;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [avatarInput, aboutMeInput];
}
