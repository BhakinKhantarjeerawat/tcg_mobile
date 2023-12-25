import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tcg_mobile/consts/app_colors.dart';
import 'package:my_tcg_mobile/consts/app_sizes.dart';
import 'package:my_tcg_mobile/consts/button_styles.dart';
import 'package:my_tcg_mobile/features/authen/model/login_responses.dart';
import 'package:my_tcg_mobile/route/route_master.dart';

final loginResultProvider = StateProvider<String>(
  (ref) => '',
);

final authenStatusProvider = StateProvider<bool>((ref) {
  return false;
});

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  bool isLoggedIn = false;
  String name = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // ref.listen<AsyncValue>(
    //   emailSignInControllerProvider,
    //   (_, state) => state.showAlertDialogOnError(context),
    // );
    // final state = ref.watch(emailSignInControllerProvider);
    // final returnData = ref.watch(emailSignInControllerProvider).value;
    // print(returnData!.id.toString());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (returnData != null) Text(returnData),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  // enabled: state.isLoading ? false : true,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: AppColor.secondary),
                    labelText: "email",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              gapH20,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  // enabled: state.isLoading ? false : true,
                  controller: _passwordController,
                  obscureText: _isVisible,
                  decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.key, color: AppColor.secondary),
                      suffixIcon: IconButton(
                          icon: _isVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          color: AppColor.secondary),
                      labelText: "password",
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              gapH30,
              Container(
                height: 51,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        style: AppButtonStyle.primary,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final dio = Dio();
                            final response = await dio.post(
                                'https://mytcg.net/api/create/record/forgood',
                                data: {
                                  "date": "2023-12-22",
                                  "type": "อื่น",
                                  "user_id": 19,
                                  "note": _emailController.text
                                });
                            final object = LoginResponse.fromMap(response.data);
                            debugPrint(object.id.toString());
                            ref.read(loginResultProvider.notifier).state =
                                object.id.toString();
                            setState(() {
                              isLoading = false;
                            });
                            ref
                                .read(routemasterDelegateProvider)
                                .push('/homeScreen');
                          } catch (e, st) {
                            debugPrint(e.toString());
                          }
                        },
                        child: const Text(
                          "Sign in",
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
