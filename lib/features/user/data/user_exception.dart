import 'package:eco_ideas/common/exceptions/ei_exception.dart';

sealed class EIUserException extends EIException {
  const EIUserException({required super.message});
}

class GetUserProfileFail implements EIUserException {
  @override
  String get message => 'Fail to fetch current user profile';
}

class UploadAvatarFail implements EIUserException {
  @override
  String get message => 'Fail to upload avatar for current user';
}

class UserProfileUpdateFail implements EIUserException {
  @override
  String get message => "Fail to update user's profile";
}
