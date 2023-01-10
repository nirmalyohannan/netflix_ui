import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) => VideoListItem(index: index)),
    );
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.amber[index * 100],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                MuteUnmuteButton(),
                RightSideButtonsSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RightSideButtonsSection extends StatelessWidget {
  const RightSideButtonsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        VideoDpButton(
            imageUrl:
                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg"),
        VideoInteractButton(
          iconData: Icons.emoji_emotions,
          buttonName: "LOL",
        ),
        VideoInteractButton(
          iconData: Icons.add,
          buttonName: "My List",
        ),
        VideoInteractButton(
          iconData: Icons.send_outlined,
          buttonName: "Share",
        ),
        VideoInteractButton(
          iconData: Icons.play_arrow,
          buttonName: "Play",
        ),
      ],
    );
  }
}

class VideoDpButton extends StatelessWidget {
  const VideoDpButton({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(side: BorderSide.none),
      elevation: 8,
      shadowColor: Colors.black,
      child: CircleAvatar(
        foregroundImage: NetworkImage(imageUrl),
        radius: 25,
      ),
    );
  }
}

class VideoInteractButton extends StatelessWidget {
  const VideoInteractButton({
    Key? key,
    required this.iconData,
    required this.buttonName,
  }) : super(key: key);
  final IconData iconData;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        kGapHeight20,
        kGapHeight20,
        Icon(
          iconData,
          size: 35,
          color: colorIcon,
          shadows: const [
            Shadow(
                color: Colors.black45, blurRadius: 20.0, offset: Offset(3, 3))
          ],
        ),
        Text(buttonName)
      ],
    );
  }
}

class MuteUnmuteButton extends StatefulWidget {
  const MuteUnmuteButton({
    Key? key,
  }) : super(key: key);

  @override
  State<MuteUnmuteButton> createState() => _MuteUnmuteButtonState();
}

class _MuteUnmuteButtonState extends State<MuteUnmuteButton> {
  IconData iconData = Icons.volume_off_outlined;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          iconData = iconData == Icons.volume_off_outlined
              ? Icons.volume_up_outlined
              : Icons.volume_off_outlined;
        });
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        child: Icon(iconData),
      ),
    );
  }
}
