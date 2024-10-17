// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:furniture_app/models/chair_product.dart';
import 'package:furniture_app/models/decoration_product.dart';
import 'package:furniture_app/models/products.dart';
import 'package:furniture_app/models/table_product.dart';
import 'package:furniture_app/screens/search/components/search_box.dart';
import '../../details/details_screen.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});
  static String id = "SearchScreen";

  @override
  _SearchScreenBodyState createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  String query = '';
  List<Product> filteredProducts = []; // Initialize empty list

  void updateSearch(String value) {
    setState(() {
      query = value;
      if (query.isEmpty) {
        filteredProducts = [];
      } else {
        filteredProducts = [
          ...chairProducts,
          ...decorationProducts,
          ...tableProducts
        ].where((product) {
          return product.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(onChanged: updateSearch),
        Expanded(
          child: ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ListTile(
                leading: Image.asset(product.image),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(product: product),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
