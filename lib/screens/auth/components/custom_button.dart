// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.title});
  VoidCallback? onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kSignUpColor, borderRadius: BorderRadius.circular(16)),
        width: double.infinity,
        height: 44,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: kBackgroundColor),
        )),
      ),
    );
  }
}
