import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class CategoryList extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryList({super.key, required this.onCategorySelected});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  List<String> categories = ['All', 'Chair', 'Tables', 'Decoration'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onCategorySelected(categories[index]);
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: kDefaultPadding,
                right: index == categories.length - 1 ? kDefaultPadding : 0),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
                color: index == selectedIndex
                    ? Colors.white.withOpacity(0.3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              categories[index],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: index == selectedIndex ? 22 : 18),
            ),
          ),
        ),
      ),
    );
  }
}
