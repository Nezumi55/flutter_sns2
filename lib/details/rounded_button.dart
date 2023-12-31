// Flutter
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.widthRate,
    required this.color,
    required this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final double widthRate;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
        width: maxWidth * widthRate,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: color,
              onPrimary: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 6.0,
              ),
              child: Text(text),
            ),
          ),
        ));
  }
}
