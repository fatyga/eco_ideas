import 'package:eco_ideas/features/auth/domain/user_profile/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository {
  UserRepository(this.ref);
  final Ref ref;
  UserProfile? user;

  Future<UserProfile?> getUser() async {}
}
