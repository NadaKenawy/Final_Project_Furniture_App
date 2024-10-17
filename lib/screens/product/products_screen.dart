import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/product/components/body.dart';
import 'package:furniture_app/screens/search/search_scareen.dart';

import 'components/product_screen_title.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  static String id = "ProductScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProductScreenTittle(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SearchScareen.id);
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/search.svg",
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: Body()),
          ],
        ),
      ),
    );
  }
}
