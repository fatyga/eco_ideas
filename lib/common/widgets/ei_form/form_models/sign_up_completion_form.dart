import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models.dart';
import 'package:formz/formz.dart';

class SignUpCompletionForm with FormzMixin {
  SignUpCompletionForm(
      {this.avatarInput = const AvatarInput.pure(),
      this.aboutMeInput = const AboutMeInput.pure()});

  final AvatarInput avatarInput;
  final AboutMeInput aboutMeInput;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [avatarInput, aboutMeInput];
}
