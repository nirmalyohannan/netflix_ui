import 'package:flutter/material.dart';

import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kGapWidth20,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        const Icon(
          Icons.cast,
          color: colorIcon,
          size: 30,
        ),
        kGapWidth20,
        Container(
          height: 40,
          width: 40,
          color: Colors.blue,
        ),
        kGapWidth20,
      ],
    );
  }
}
