import 'package:flutter/material.dart';
import 'package:furniture_app/screens/fav_products/components/fav_product_body.dart';

import 'components/custom_app_bar copy.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  static String id = "FavoritesScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body: const FavProductBody(),
    );
  }
}
