import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models.dart';

import 'package:formz/formz.dart';

part 'sign_in_form_model.dart';
part 'sign_up_form_model.dart';
part 'sign_up_completion_form.dart';
part 'password_reset_second_step_form.dart';
part 'password_reset_first_step_form_model.dart';

sealed class EIFormModel with FormzMixin {}
