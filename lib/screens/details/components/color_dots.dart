import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class ColorsDot extends StatelessWidget {
  const ColorsDot({
    super.key,
    required this.color,
    this.isSelected = false,
    required this.onSelectedChanged,
  });

  final Color color;
  final bool isSelected;
  final Function(bool) onSelectedChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectedChanged(!isSelected);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
        padding: const EdgeInsets.all(3),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 108, 160, 202)
                : Colors.transparent,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}

class ListOfColors extends StatefulWidget {
  const ListOfColors({super.key});

  @override
  ListOfColorsState createState() => ListOfColorsState();
}

class ListOfColorsState extends State<ListOfColors> {
  List<bool> isSelectedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorsDot(
            color: const Color.fromARGB(255, 108, 160, 202),
            isSelected: isSelectedList[0],
            onSelectedChanged: (value) {
              setState(() {
                isSelectedList[0] = value;
              });
            },
          ),
          ColorsDot(
            color: const Color.fromARGB(182, 0, 57, 103),
            isSelected: isSelectedList[1],
            onSelectedChanged: (value) {
              setState(() {
                isSelectedList[1] = value;
              });
            },
          ),
          ColorsDot(
            color: const Color.fromARGB(255, 7, 84, 77),
            isSelected: isSelectedList[2],
            onSelectedChanged: (value) {
              setState(() {
                isSelectedList[2] = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
