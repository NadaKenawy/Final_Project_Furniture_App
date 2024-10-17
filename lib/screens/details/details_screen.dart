import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/products.dart'; 
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/details/components/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;

  const DetailsScreen({super.key, this.product});

  static String id = "DetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: builAppBar(context),
      body: DetailsBody(
        product: product,
      ),
    );
  }

  AppBar builAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'BACK',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.id);
            },
            icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          ),
        ),
      ],
    );
  }
}
