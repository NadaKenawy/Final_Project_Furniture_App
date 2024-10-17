import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/chair_product.dart';
import 'package:furniture_app/models/table_product.dart';
import 'package:furniture_app/models/decoration_product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/screens/product/components/category_list.dart';
import 'package:furniture_app/screens/product/components/product_card.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart'; // Import your cart screen
import 'package:furniture_app/screens/fav_products/fav_product_screen.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart'; // Import your favorites screen // Import your profile screen

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedCategory = 'All';
  int numberOfItems = 3;
  int _selectedIndex = 0; 

  List<T> getRandomItems<T>(List<T> items, int count) {
    final random = Random();
    final shuffled = List<T>.from(items)..shuffle(random);
    return shuffled.take(count).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Home
        Navigator.of(context).pushNamed(ProductsScreen.id);
        break;
      case 1: // Favorites
        Navigator.of(context).pushNamed(FavoritesScreen.id);
        break;
      case 2: // Cart
        Navigator.of(context).pushNamed(CartScreen.id);
        break;
      case 3: // Profile
        Navigator.of(context).pushNamed(ProfileScreen.id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> productsToShow = [];

    if (selectedCategory == 'All') {
      final randomChairs = getRandomItems(chairProducts, numberOfItems);
      final randomTables = getRandomItems(tableProducts, numberOfItems);
      final randomDecorations =
          getRandomItems(decorationProducts, numberOfItems);

      productsToShow = [
        ...randomChairs,
        ...randomTables,
        ...randomDecorations,
      ];
    } else if (selectedCategory == 'Chair') {
      productsToShow = chairProducts;
    } else if (selectedCategory == 'Tables') {
      productsToShow = tableProducts;
    } else if (selectedCategory == 'Decoration') {
      productsToShow = decorationProducts;
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: CategoryList(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
            ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: productsToShow.length,
                    itemBuilder: (context, index) {
                      var product = productsToShow[index];
                      return ProductCard(
                        product: product,
                        itemIndex: index,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: product,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70, 
              decoration: const BoxDecoration(
                color: kBackgroundColor, 
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidHeart),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.cartShopping),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidUser),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: kSecondaryColor, 
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
