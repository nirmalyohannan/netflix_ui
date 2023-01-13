import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';

var bottomNavBarIndex = 0.obs;

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => BottomNavigationBar(
            currentIndex: bottomNavBarIndex.value,
            onTap: (value) {
              bottomNavBarIndex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: colorBackground,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700],
            // selectedLabelStyle: const TextStyle(overflow: TextOverflow.visible),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: "New & Hot"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: "Fast Laughs"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download_for_offline), label: "Downloads"),
            ],
          )),
    );
  }
}
