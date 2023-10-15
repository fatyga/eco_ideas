import 'package:eco_ideas/features/auth/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserProfile', () {
    UserProfile createSubject({
      String uid = '123',
      String username = 'John',
      String avatarURL = 'john_avatar.png',
    }) {
      return UserProfile(uid: uid, username: username, avatarURL: avatarURL);
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
            uid: '1234',
            username: 'username123',
            avatarURL: 'avatar123',
          ),
          equals(
            createSubject(
              uid: '1234',
              username: 'username123',
              avatarURL: 'avatar123',
            ),
          ),
        );
      });
    });

    group('formJson', () {
      test('works correctly', () {
        final json = <String, dynamic>{
          'uid': '123',
          'username': 'John',
          'avatarURL': 'john_avatar.png',
        };

        expect(UserProfile.fromJson(json), equals(createSubject()));
      });
    });

    group('toJson', () {
      test('works correctly', () {
        final json = <String, dynamic>{
          'uid': '123',
          'username': 'John',
          'avatarURL': 'john_avatar.png',
        };

        expect(createSubject().toJson(), equals(json));
      });
    });
  });
}
