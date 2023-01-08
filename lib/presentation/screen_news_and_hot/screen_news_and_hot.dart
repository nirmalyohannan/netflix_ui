import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/widgets/widget_app_bar.dart';

class ScreenNewsAndHot extends StatelessWidget {
  const ScreenNewsAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: WidgetAppBar(
              title: "Hot and New",
            )),
        body: Text("News and Hot Screen"));
  }
}
