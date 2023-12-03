//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sns/constants/strings.dart';
import 'package:flutter_sns/details/rounded_button.dart';
import 'package:flutter_sns/details/rounded_password_field.dart';
//components
import 'package:flutter_sns/details/rounded_text_field.dart';
//models
import 'package:flutter_sns/models/signup_model.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: signupModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: signupModel.password);
    return Scaffold(
      appBar: AppBar(
        title: const Text(signupTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
              controller: emailEditingController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (text) => signupModel.email = text,
              color: Colors.white,
              borderColor: Colors.black,
              shadowColor: Colors.orange.withOpacity(0.3),
              hintText: mailAddressText),
          RoundedPasswordField(
            onChanged: (text) => signupModel.password = text,
            passwordEditingController: passwordEditingController,
            obscureText: signupModel.isObscure,
            toggleObscureText: () => signupModel.toggleIsObscure(),
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.orange.withOpacity(0.3),
          ),
          RoundedButton(
              onPressed: () => signupModel.createUser(context: context),
              widthRate: 0.5,
              color: Colors.orange.withOpacity(0.6),
              text:signupText,
              ),
        ],
      ),
    );
  }
}
