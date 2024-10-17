import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class CustomTitleText extends StatelessWidget {
  final String titleText;

  const CustomTitleText({
    super.key,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleText,
          style: const TextStyle(fontSize: 24, color: kSignUpColor),
        ),
      ],
    );
  }
}
