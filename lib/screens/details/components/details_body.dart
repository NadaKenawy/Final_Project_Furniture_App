import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/screens/details/components/add_to_cart.dart';
import 'package:furniture_app/screens/details/components/list_of_colors.dart';
import 'package:furniture_app/screens/details/components/product_image.dart';
import 'package:furniture_app/screens/fav_products/bloc/fav_product_cubit.dart';

class DetailsBody extends StatefulWidget {
  final Product? product;

  const DetailsBody({super.key, this.product});

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  int numOfProduct = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final favProduct = FavProduct(
      imageUrl: widget.product!.image,
      title: widget.product!.title,
      price: widget.product!.price,
    );

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: '${widget.product!.id}',
                      child: ProductPoster(
                        size: size,
                        image: widget.product!.image,
                      ),
                    ),
                  ),
                  const ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                    ),
                    child: Text(
                      widget.product!.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        numOfProduct == 0
                            ? "${widget.product!.price} \$"
                            : "${widget.product!.price * numOfProduct} \$",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.remove, color: kSecondaryColor),
                        onPressed: () {
                          setState(() {
                            if (numOfProduct > 0) {
                              numOfProduct--;
                            }
                          });
                        },
                      ),
                      Text(
                        "$numOfProduct",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: kSecondaryColor),
                        onPressed: () {
                          setState(() {
                            numOfProduct++;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 2,
                    ),
                    child: Text(
                      widget.product!.description,
                      style: const TextStyle(color: kTextLightColor),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: [
                  // Expanded لزر Add to Cart
                  Expanded(
                    child: AddToCart(
                      imageUrl: widget.product!.image,
                      title: widget.product!.title,
                      price: widget.product!.price,
                      quantity: numOfProduct,
                    ),
                  ),
                  BlocBuilder<FavProductCubit, FavProductState>(
                    builder: (context, state) {
                      final isFavorite = state.products.contains(favProduct);
                      return Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kSecondaryColor,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                              color: kSecondaryColor.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: FaIcon(
                            isFavorite
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: isFavorite ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<FavProductCubit>()
                                .toggleFavorite(favProduct);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
