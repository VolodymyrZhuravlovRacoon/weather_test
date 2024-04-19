import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double? horizontal;
  final double? vertical;

  const Gap({
    Key? key,
    this.horizontal,
    this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vertical,
      width: horizontal,
    );
  }
}
