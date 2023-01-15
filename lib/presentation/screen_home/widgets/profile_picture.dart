import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: const CustomNetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png"),
      ),
    );
  }
}
