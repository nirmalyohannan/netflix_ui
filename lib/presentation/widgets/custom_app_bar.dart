import 'package:flutter/material.dart';

import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.bottom});
  final String title;
  final Widget? bottom;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            kGapWidth20,
            Expanded(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: kFontSizeAppBarTitle, fontWeight: FontWeight.bold),
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
        ),
        bottom != null ? bottom! : const SizedBox(),
      ],
    );
  }
}
