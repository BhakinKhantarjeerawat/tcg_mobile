import 'package:my_tcg_mobile/features/authen/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_signin_controller.g.dart';

@riverpod
class EmailSignInController extends _$EmailSignInController {
  @override
  FutureOr<void> build() {}

  Future<bool> emailSignIn({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.watch(fetchHomeProvider);
    // state = const AsyncValue.loading();
    // state = await AsyncValue.guard(
    //     () => authRepository.emailSignIn(email: email, password: password));
    // return state.hasError == false;
    return true;
  }
}
