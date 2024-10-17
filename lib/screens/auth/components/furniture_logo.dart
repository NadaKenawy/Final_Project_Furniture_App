import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class FurnitureLogo extends StatelessWidget {
  const FurnitureLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          kLogo,
          height: 160,
        ),
        const Text(
          'Furniture App',
          style: TextStyle(
              fontSize: 32, color: kSignUpColor, fontFamily: 'pacifico'),
        ),
      ],
    );
  }
}
