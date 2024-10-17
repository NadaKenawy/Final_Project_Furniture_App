import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/cart/bloc/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final CartProduct product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.2; // Image size

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
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}'),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: onDecrease,
              ),
              Text(
                '${product.quantity}',
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: onIncrease,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
