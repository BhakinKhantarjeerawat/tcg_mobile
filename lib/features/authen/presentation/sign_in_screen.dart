import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tcg_mobile/consts/app_colors.dart';
import 'package:my_tcg_mobile/consts/app_sizes.dart';
import 'package:my_tcg_mobile/consts/button_styles.dart';
import 'package:my_tcg_mobile/features/authen/presentation/email_signin_controller.dart';
import 'package:my_tcg_mobile/route/route_master.dart';
import 'package:my_tcg_mobile/utils/async_value_ui.dart';

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

  @override
  Widget build(BuildContext context) {
    // ref.listen<AsyncValue>(
    //   emailSignInControllerProvider,
    //   (_, state) => state.showAlertDialogOnError(context),
    // );
    final state = ref.watch(emailSignInControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  enabled: state.isLoading ? false : true,
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
                  enabled: state.isLoading ? false : true,
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
              state.isLoading
                  ? const CircularProgressIndicator()
                  : Container(
                      height: 51,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: AppButtonStyle.primary,
                        onPressed: () async {
                          // ref.read(authenStatusProvider.notifier).state = true;
                          ref
                              .read(routemasterDelegateProvider)
                              .push('/homeScreen');
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
