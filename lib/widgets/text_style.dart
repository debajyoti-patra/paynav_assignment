import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BlueText extends StatelessWidget {
  final String title;
  const BlueText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors().blue11,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String title;
  final double fontSize;
  const SubtitleText({
    super.key,
    required this.title,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: AppColors().black1.withOpacity(0.5), fontSize: fontSize),
    );
  }
}

class BoldText extends StatelessWidget {
  final String title;
  const BoldText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

