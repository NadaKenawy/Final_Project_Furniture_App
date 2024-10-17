import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/search/components/search_screen_body.dart';

class SearchScareen extends StatelessWidget {
  const SearchScareen({super.key});
  static String id = "SearchScareen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      body: const SearchScreenBody(),
    );
  }
}
