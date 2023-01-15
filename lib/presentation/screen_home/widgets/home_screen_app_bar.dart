import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/profile_picture.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    Key? key,
    required this.scrollNotifier,
  }) : super(key: key);

  final RxBool scrollNotifier;

  @override
  Widget build(BuildContext context) {
    return Obx(() => scrollNotifier.value
        ? Container(
            // color: Colors.black,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black,
                Colors.black.withOpacity(0),
              ],
            )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HomeScreenAppBarSection1(),
                kGapHeight10,
                const HomeScreenAppBarSection2(),
                kGapHeight20,
                kGapHeight20,
                kGapHeight20,
              ],
            ),
          )
        : const SizedBox());
  }
}

class HomeScreenAppBarSection1 extends StatelessWidget {
  const HomeScreenAppBarSection1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
          height: 50,
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: colorIcon,
          size: 30,
        ),
        kGapWidth20,
        const ProfilePicture(),
        kGapWidth20,
      ],
    );
  }
}

class HomeScreenAppBarSection2 extends StatelessWidget {
  const HomeScreenAppBarSection2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text(
          "TV Shows",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "Movies",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        CatergoriesDropDownButton(),
      ],
    );
  }
}

class CatergoriesDropDownButton extends StatelessWidget {
  const CatergoriesDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.arrow_drop_down,
          color: colorIcon,
        )
      ],
    );
  }
}
