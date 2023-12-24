// import 'package:my_tcg_mobile/features/authen/model/login_responses.dart';
// import 'package:my_tcg_mobile/network/dio.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'email_signin_controller.g.dart';

// @riverpod
// class EmailSignInController extends _$EmailSignInController {
//   @override
//   FutureOr<void> build() {
//         // throw Exception('login errror');
//   }

//   Future<Map<String, dynamic>> emailSignIn({
//     required String email,
//     required String password,
//   }) async {
//     final dio = ref.watch(dioProvider);
//     state = const AsyncValue.loading();
//     try {
//       final response =  await  dio.post('https://mytcg.net/api/create/record/forgood',
//       data:{"date":"2023-12-22",
//           "type":"อื่น",
//           "user_id":19,
//           "note":email
//         });
//      state = AsyncData(response.data);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//     throw Exception('login errror');
//   }
// }
