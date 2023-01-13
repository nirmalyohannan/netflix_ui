import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';

import 'package:netflix_ui/presentation/widgets/custom_app_bar.dart';

class ScreenNewsAndHot extends StatelessWidget {
  const ScreenNewsAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedTab = 1.obs;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: CustomAppBar(
              title: "New and Hot",
              bottom: _CustomTabBar(selectedTab: selectedTab),
            ),
          ),
          body: const Text("News and Hot Screen")),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  const _CustomTabBar({
    Key? key,
    required this.selectedTab,
  }) : super(key: key);

  final RxInt selectedTab;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ChoiceChip(
            backgroundColor: Colors.black,
            label: Text(
              "🍿 Coming Soon",
              style: TextStyle(
                  color: selectedTab.value == 1 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            selected: selectedTab.value == 1,
            onSelected: (value) => selectedTab.value = 1,
          ),
          ChoiceChip(
            backgroundColor: Colors.black,
            label: Text(
              "👀 Everyone's Watching",
              style: TextStyle(
                  color: selectedTab.value == 2 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            selected: selectedTab.value == 2,
            onSelected: (value) => selectedTab.value = 2,
          ),
        ],
      ),
    );
  }
}
