import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/cart/components/cart_body.dart';
import 'package:furniture_app/screens/cart/components/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static String id = "CartScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: builAppBar(context),
      body: const CartPage(),
    );
  }
}
