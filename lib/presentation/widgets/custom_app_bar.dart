import 'package:flutter/material.dart';

import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/profile_picture.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

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
            const ProfilePicture(),
            kGapWidth20,
          ],
        ),
        bottom != null ? bottom! : const SizedBox(),
      ],
    );
  }
}
