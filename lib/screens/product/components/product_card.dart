import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.itemIndex,
    required this.product,
    required this.press,
  });

  final int itemIndex;
  final dynamic product;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      height: 160,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: itemIndex.isEven ? kSignUpColor : kSecondaryColor,
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: '${product.id}',
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 160,
                  width: 200,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                    height: 170,
                    width: 170,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  height: 140,
                  width: size.width - 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding / 4),
                        decoration: const BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Text(
                          "${product.price} \$",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
