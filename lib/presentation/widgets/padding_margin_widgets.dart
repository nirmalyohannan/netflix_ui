import 'package:flutter/material.dart';

class HorizontalPadding10 extends StatelessWidget {
  const HorizontalPadding10({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: child,
    );
  }
}

class PaddingAll10 extends StatelessWidget {
  const PaddingAll10({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
