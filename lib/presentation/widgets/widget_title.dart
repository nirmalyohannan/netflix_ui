import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
