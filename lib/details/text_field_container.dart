//flutter
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.borderColor,
    required this.child,
    required this.shadowColor,
  }) : super(key: key);
  final Color borderColor;
  final Color shadowColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          boxShadow:[BoxShadow(
            color: shadowColor,
            blurRadius: 2.0,
            offset: const Offset(0, 0),
            )],
          borderRadius: BorderRadius.circular(6),
        ),
        child: child,
      ),
    );
  }
}
