import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/cart/bloc/cart_cubit.dart'; 

class AddToCart extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;

  const AddToCart({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.height * .3,
        margin: const EdgeInsets.all(kDefaultPadding),
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 1.5),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {
            BlocProvider.of<CartCubit>(context).addProduct(CartProduct(
              imageUrl: imageUrl,
              title: title,
              price: price,
              quantity: quantity,
            ));
          },
          child: const Center(
            child: Text(
              "Add To Cart",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
