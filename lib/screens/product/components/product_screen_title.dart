import 'package:flutter/material.dart';

class ProductScreenTittle extends StatelessWidget {
  const ProductScreenTittle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Find Your",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28, 
            fontWeight: FontWeight.w300, 
          ),
        ),
        SizedBox(height: 2), 
        Text(
          "Dream Furniture",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36, 
          ),
        ),
      ],
    );
  }
}
