import 'package:eco_ideas/features/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserProfile', () {
    UserProfile createSubject({
      String id = '123',
      String username = 'John',
      bool isAvatarPresent = false,
    }) {
      return UserProfile(
        id: id,
        username: username,
        isAvatarPresent: isAvatarPresent,
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
            isAvatarPresent: true,
          ),
          equals(
            createSubject(
              id: '1234',
              username: 'username123',
              isAvatarPresent: true,
            ),
          ),
        );
      });
    });

    group('formJson', () {
      test('works correctly', () {
        final json = <String, dynamic>{
          'id': '123',
          'username': 'John',
          'is_avatar_present': false,
        };

        expect(UserProfile.fromJson(json), equals(createSubject()));
      });
    });

    group('toJson', () {
      test('works correctly', () {
        final json = <String, dynamic>{
          'id': '123',
          'username': 'John',
          'is_avatar_present': false,
        };

        expect(createSubject().toJson(), equals(json));
      });
    });
  });
}
