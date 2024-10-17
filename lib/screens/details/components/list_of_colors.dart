import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/details/components/color_dots.dart';

class ListOfColors extends StatefulWidget {
  const ListOfColors({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListOfColorsState createState() => _ListOfColorsState();
}

class _ListOfColorsState extends State<ListOfColors> {
  int selectedIndex = -1; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorsDot(
            color: const Color.fromARGB(255, 108, 160, 202),
            isSelected: selectedIndex ==
                0, 
            onSelectedChanged: (selected) {
              setState(() {
                selectedIndex = selected ? 0 : -1;
              });
            },
          ),
          ColorsDot(
            color: const Color.fromARGB(182, 0, 57, 103),
            isSelected: selectedIndex ==
                1, 
            onSelectedChanged: (selected) {
              setState(() {
                selectedIndex = selected ? 1 : -1;
              });
            },
          ),
          ColorsDot(
            color: const Color.fromARGB(255, 7, 84, 77),
            isSelected: selectedIndex ==
                2, 
            onSelectedChanged: (selected) {
              setState(() {
                selectedIndex = selected ? 2 : -1;
              });
            },
          ),
        ],
      ),
    );
  }
}
