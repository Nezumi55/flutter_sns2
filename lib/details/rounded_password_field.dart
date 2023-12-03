// flutter
import 'package:flutter/material.dart';
import 'package:flutter_sns/constants/strings.dart';
import 'package:flutter_sns/details/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  RoundedPasswordField({
    Key? key,
    required this.color,
    required this.onChanged,
    required this.passwordEditingController,
    required this.obscureText,
    required this.toggleObscureText,
    required this.borderColor,
    required this.shadowColor,
  }) : super(key: key);
  final Color color;
  final void Function(String)? onChanged;
  final TextEditingController? passwordEditingController;
  final bool obscureText;
  final void Function()? toggleObscureText;
  final Color borderColor, shadowColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      borderColor: borderColor,
      shadowColor: shadowColor,
      child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: passwordEditingController,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
              suffix: InkWell(
                onTap: toggleObscureText,
                child: obscureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              hintText: passwordText,
              hintStyle: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
