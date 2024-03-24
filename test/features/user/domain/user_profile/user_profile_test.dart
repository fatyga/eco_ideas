import 'package:eco_ideas/features/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserProfile', () {
    UserProfile createSubject({
      String id = '123',
      String username = 'John',
      String aboutMe = 'I am John',
      bool signUpCompleted = false,
    }) {
      return UserProfile(
        id: id,
        username: username,
        aboutMe: aboutMe,
        signUpCompleted: false,
      );
    }

    group('constructor', () {
      test('works correctly', () => expect(createSubject, returnsNormally));

      test('support value equality', () {
        expect(createSubject(), equals(createSubject()));
      });
    });

    group('copyWith', () {
      test('returns the same object if no arugments are provided', () {
        expect(createSubject().copyWith(), equals(createSubject()));
      });

      test('returns new object with updated values if arguments are provided',
          () {
        expect(
          createSubject().copyWith(
            id: '1234',
            username: 'username123',
          ),
          equals(
            createSubject(
              id: '1234',
              username: 'username123',
            ),
          ),
        );
      });
    });

    group('formJson', () {
      test('works correctly', () {
        final profile = createSubject();
        final json = <String, dynamic>{
          'id': profile.id,
          'username': profile.username,
          'about_me': profile.aboutMe,
          'sign_up_completed': profile.signUpCompleted,
        };

        expect(UserProfile.fromJson(json), equals(createSubject()));
      });
    });

    group('toJson', () {
      test('works correctly', () {
        final profile = createSubject();
        final json = <String, dynamic>{
          'username': profile.username,
          'about_me': profile.aboutMe,
          'sign_up_completed': profile.signUpCompleted,
        };

        expect(createSubject().toJson(), equals(json));
      });
    });
  });
}
