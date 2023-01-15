import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';

class NewAndHotTabBar extends StatelessWidget {
  const NewAndHotTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingHorizontal10,
      child: TabBar(
          unselectedLabelColor: colorText,
          labelColor: colorTextBlack,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: colorButtonWhite),
          tabs: const [
            Tab(
              child: Text("🍿 Coming Soon"),
            ),
            Tab(
              text: "👀 Everyone's watching",
            )
          ]),
    );
  }
}
