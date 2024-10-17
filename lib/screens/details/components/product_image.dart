import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width * 0.7,
            width: size.height * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image,
            height: size.width * 0.75,
            width: size.height * 0.75,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
