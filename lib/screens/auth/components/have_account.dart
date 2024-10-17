import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class HaveAccount extends StatelessWidget {
  final String hintText;
  final String pageRoute;
  final String messageText;

  const HaveAccount({
    super.key,
    required this.hintText,
    required this.pageRoute,
    required this.messageText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          messageText,
          style: const TextStyle(color: kSignUpColor),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, pageRoute),
          child: Text(
            ' $hintText',
            style: const TextStyle(color: kTextColor),
          ),
        ),
      ],
    );
  }
}
