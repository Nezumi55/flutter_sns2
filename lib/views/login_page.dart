//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sns/constants/strings.dart';
import 'package:flutter_sns/details/rounded_button.dart';
// model
import 'package:flutter_sns/models/login_model.dart';
// components
import 'package:flutter_sns/details/rounded_text_field.dart';
import 'package:flutter_sns/details/rounded_password_field.dart';
// comstants
import 'package:flutter_sns/constants/routes.dart' as routes;

class LoginPage extends ConsumerWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: loginModel.password);
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.blue.withOpacity(0.3),
            hintText: mailAddressText,
          ),
          RoundedPasswordField(
            onChanged: (text) => loginModel.password = text,
            passwordEditingController: passwordEditingController,
            obscureText: loginModel.isObscure,
            toggleObscureText: () => loginModel.toggleIsObscure(),
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.blue.withOpacity(0.3),
          ),
          RoundedButton(
            onPressed: () async => await loginModel.login(context: context),
            widthRate: 0.6,
            color: Colors.blue.withOpacity(0.6),
            text: loginText,
          ),
          TextButton(
            onPressed: () => routes.toSignupPage(context: context),
            child: const Text(
              noAccountMsg,
              // style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
