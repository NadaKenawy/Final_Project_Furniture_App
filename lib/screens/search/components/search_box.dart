import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 4, horizontal: kDefaultPadding),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(25)),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
