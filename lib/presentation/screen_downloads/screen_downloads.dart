import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/logic/screen_downloads/get_download_images.dart';
import 'package:netflix_ui/presentation/widgets/custom_app_bar.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    getDownloadsImages();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: "Downloads",
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          kGapHeight10,
          const _SmartDownloads(),
          kGapHeight20,
          kGapHeight10,
          const IntroDownloadsDescription(),
          _StackedImages(size: size),
          const _SetUpButton(),
          const _SeeWhatButton()
        ]),
      ),
    );
  }
}

class IntroDownloadsDescription extends StatelessWidget {
  const IntroDownloadsDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Text(
            "Introducing Downloads for You",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        kGapHeight20,
        const Text(
          "We'll download a personalised selection of \n movies and shows for you, so there's \nalways something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }
}

class _SeeWhatButton extends StatelessWidget {
  const _SeeWhatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: colorButtonWhite,
        onPressed: () {},
        child: const Text(
          "See what you can download",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _SetUpButton extends StatelessWidget {
  const _SetUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: MaterialButton(
        color: colorButton,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: const Text(
          "Set Up",
          style: TextStyle(
              color: colorText, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _StackedImages extends StatelessWidget {
  const _StackedImages({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: size.width,
          height: size.width,
          child: Center(
            child: downloadImagesModel.value == null
                ? const CircularProgressIndicator(color: colorText)
                : Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      radius: size.width / 3,
                      backgroundColor: Colors.grey[800],
                    ),
                    DownloadsImage(
                      imageUrl: downloadImagesModel.value!.imageUrl1,
                      size: size.width / 3.5,
                      angle: -20 * pi / 180,
                      horizontal: -size.width / 4.5,
                      vertical: 10,
                    ),
                    DownloadsImage(
                      imageUrl: downloadImagesModel.value!.imageUrl2,
                      size: size.width / 3.5,
                      angle: 20 * pi / 180,
                      horizontal: size.width / 4.5,
                      vertical: 10,
                    ),
                    DownloadsImage(
                      imageUrl: downloadImagesModel.value!.imageUrl3,
                      size: size.width / 2.8,
                    ),
                  ]),
          ),
        ));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: colorIcon,
        ),
        kGapWidth10,
        const Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImage extends StatelessWidget {
  const DownloadsImage(
      {Key? key,
      required this.imageUrl,
      this.horizontal = 0,
      this.vertical = 0,
      this.angle = 0,
      required this.size})
      : super(key: key);

  final String imageUrl;
  final double size;
  final double horizontal;
  final double vertical;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(horizontal, vertical),
      child: Transform.rotate(
        angle: angle,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomNetworkImage(imageUrl, width: size)),
      ),
    );
  }
}
