import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class TestAuthRepository extends AuthRepository {
  TestAuthRepository() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('AuthRepository', () {
    test('can be constructed', () {
      expect(TestAuthRepository.new, returnsNormally);
    });
  });
}
