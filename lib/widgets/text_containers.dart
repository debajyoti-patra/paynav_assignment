
import 'package:flutter/material.dart';
import 'package:paynav_assignment/screens/home_page.dart';
import 'package:paynav_assignment/widgets/text_style.dart';

import '../constants/colors.dart';

class DataText extends StatelessWidget {
  final String title;
  final String score;
  const DataText({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                //SubtitleText(title: '',fontSize: 13,)
              ],
            ),
            BoldText(title: score),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          width: double.maxFinite,
          color: AppColors().black1.withOpacity(0.3),
        ),
      ],
    );
  }
}

class DataText2 extends StatelessWidget {
  final String title;
  final String score;
  final String subTitle;
  const DataText2(
      {super.key,
      required this.title,
      required this.score,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                SubtitleText(title: subTitle)
              ],
            ),
            BoldText(title: score),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          width: double.maxFinite,
          color: AppColors().black1.withOpacity(0.3),
        ),
      ],
    );
  }
}

class DataText3 extends StatelessWidget {
  final String title;
  final String score;
  final String subTitle;
  const DataText3(
      {super.key,
      required this.title,
      required this.score,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                SubtitleText(title: subTitle)
              ],
            ),
            BoldText(title: score),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        
      ],
    );
  }
}
