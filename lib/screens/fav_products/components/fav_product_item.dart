import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

import '../bloc/fav_product_cubit.dart';

class FavProductItem extends StatelessWidget {
  final FavProduct product;
  final VoidCallback onFavoriteToggle;

  const FavProductItem({
    super.key,
    required this.product,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.2; 

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Row(
        children: [
          Image.asset(product.imageUrl, width: imageSize, height: imageSize),
          const SizedBox(width: kDefaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}', 
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite), 
            onPressed: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}
