// import 'package:eco_ideas/features/auth/auth.dart';
// import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
// import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
// import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/controller/state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class MockAuthRepository extends Mock implements AuthRepository {}

// class Listener<T> extends Mock {
//   void call(T? current, T next) {}
// }

// void main() {
//   ProviderContainer makeProviderContainer({
//     AuthRepository? authRepository,
//   }) {
//     final container = ProviderContainer(
//       overrides: [
//         if (authRepository != null)
//           authRepositoryProvider.overrideWith((_) => authRepository),
//       ],
//     );

//     addTearDown(container.dispose);
//     return container;
//   }

//   setUpAll(() {
//     registerFallbackValue(const AsyncLoading<PasswordResetFirstStepState>());
//   });

//   group('PasswordResetFirstStepController', () {
//     group('build method', () {
//       test('initial state is PasswordResetFirstStepState', () async {
//         final container = makeProviderContainer();

//         final listener = Listener<AsyncValue<PasswordResetFirstStepState>>();

//         container.listen(
//           passwordResetFirstStepControllerProvider,
//           listener.call,
//           fireImmediately: true,
//         );

//         verifyInOrder([
//           () => listener.call(
//                 null,
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//               ),
//         ]);
//       });
//     });

//     group('updateEmailField', () {
//       const enteredValue = 'john.doe@gmail.com';

//       test('set email to EmailInput.pure() when newValue is empty', () {
//         final container = makeProviderContainer();
//         final listener = Listener<AsyncValue<PasswordResetFirstStepState>>();
//         container.listen(
//           passwordResetFirstStepControllerProvider,
//           listener.call,
//           fireImmediately: true,
//         );

//         final controller = container
//             .read(passwordResetFirstStepControllerProvider.notifier)
//           ..updateEmailField('');

//         verifyInOrder([
//           () => listener.call(
//                 null,
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//               ),
//           () => listener.call(
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//               ),
//         ]);

//         expect(controller.state.requireValue.emailInput.isPure, equals(true));
//         expect(controller.state.requireValue.emailInput.value, equals(''));
//         verifyNoMoreInteractions(listener);
//       });

//       test('''
// set email to EmailInput.dirty(value: newValue) when [newValue] is provided''',
//           () {
//         final container = makeProviderContainer();
//         final listener = Listener<AsyncValue<PasswordResetFirstStepState>>();
//         container.listen(
//           passwordResetFirstStepControllerProvider,
//           listener.call,
//           fireImmediately: true,
//         );

//         final controller = container
//             .read(passwordResetFirstStepControllerProvider.notifier)
//           ..updateEmailField(enteredValue);

//         verifyInOrder([
//           () => listener.call(
//                 null,
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//               ),
//           () => listener.call(
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(
//                     emailInput: EmailInput.dirty(value: enteredValue),
//                   ),
//                 ),
//               ),
//         ]);

//         expect(
//           controller.state.requireValue.emailInput.isPure,
//           equals(false),
//         );

//         expect(
//           controller.state.requireValue.emailInput.value,
//           equals(enteredValue),
//         );
//         verifyNoMoreInteractions(listener);
//       });
//     });

//     group('resetPasswordForEmail', () {
//       const invalidEmail = 'incomplete@';
//       const validEmail = 'john.doe@gmail.com';
//       test('does nothing, if state.isValid == false', () async {
//         final authRepository = MockAuthRepository();
//         final container = makeProviderContainer(authRepository: authRepository);

//         final listener = Listener<AsyncValue<PasswordResetFirstStepState>>();

//         container.listen(
//           passwordResetFirstStepControllerProvider,
//           listener.call,
//           fireImmediately: true,
//         );

//         final controller = container
//             .read(passwordResetFirstStepControllerProvider.notifier)
//           ..updateEmailField(invalidEmail);
//         await controller.submit();

//         verifyInOrder([
//           () => listener.call(
//                 null,
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//               ),
//         ]);

//         verifyNever(
//           () => authRepository.resetPasswordForEmail(
//             email: invalidEmail,
//           ),
//         );
//       });

//       test('''
// if state.isValid == true, invokes AuthRepository.resetPasswordForEmail and change status to linkSent'
//           ''', () async {
//         const emailValue = validEmail;
//         final authRepository = MockAuthRepository();

//         when(
//           () => authRepository.resetPasswordForEmail(
//             email: emailValue,
//           ),
//         ).thenAnswer((_) => Future.value());

//         final container = makeProviderContainer(authRepository: authRepository);

//         final listener = Listener<AsyncValue<PasswordResetFirstStepState>>();

//         container.listen(
//           passwordResetFirstStepControllerProvider,
//           listener.call,
//           fireImmediately: true,
//         );

//         final controller = container
//             .read(passwordResetFirstStepControllerProvider.notifier)
//           ..updateEmailField(emailValue);
//         await controller.submit();

//         verify(() => authRepository.resetPasswordForEmail(email: emailValue))
//             .called(1);
//         verifyInOrder([
//           () => listener.call(
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(),
//                 ),
//                 any(that: isA<AsyncLoading<PasswordResetFirstStepState>>()),
//               ),
//           () => listener.call(
//                 any(that: isA<AsyncLoading<PasswordResetFirstStepState>>()),
//                 const AsyncData<PasswordResetFirstStepState>(
//                   PasswordResetFirstStepState(
//                     emailInput: EmailInput.dirty(value: validEmail),
//                     status: PasswordResetFirstStepStatus.linkSent,
//                   ),
//                 ),
//               ),
//         ]);
//       });

//       test(
//         '''emits AsyncError, when AuthRepository.resetPasswordForEmail throws an error''',
//         () async {
//           const emailValue = invalidEmail;
//           final authRepository = MockAuthRepository();

//           when(
//             () => authRepository.resetPasswordForEmail(
//               email: emailValue,
//             ),
//           ).thenThrow(PasswordResetLinkSendFail());

//           final container =
//               makeProviderContainer(authRepository: authRepository);

//           final listener = Listener<AsyncValue<PasswordResetFirstStepState>>();

//           container.listen(
//             passwordResetFirstStepControllerProvider,
//             listener.call,
//             fireImmediately: true,
//           );

//           final controller = container
//               .read(passwordResetFirstStepControllerProvider.notifier)
//             ..updateEmailField(emailValue);
//           await controller.submit();

// ignore_for_file: lines_longer_than_80_chars

//           verifyInOrder([
//             () => listener.call(
//                   const AsyncData<PasswordResetFirstStepState>(
//                     PasswordResetFirstStepState(),
//                   ),
//                   any(that: isA<AsyncLoading<PasswordResetFirstStepState>>()),
//                 ),
//             () => listener.call(
//                   any(that: isA<AsyncLoading<PasswordResetFirstStepState>>()),
//                   any(that: isA<AsyncError<PasswordResetFirstStepScreen>>()),
//                 ),
//           ]);
//         },
//       );
//     });
//   });
// }
