import 'package:flutter/material.dart';
import 'package:paynav_assignment/widgets/text_style.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../data/userdata.dart';

class TabIndicator extends BoxDecoration {
  final BoxPainter _painter;

  TabIndicator() : _painter = _TabIndicatorPainter();

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _TabIndicatorPainter extends BoxPainter {
  final Paint _paint;

  _TabIndicatorPainter()
      : _paint = Paint()
          ..color = AppColors().blue11
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double _xPos = offset.dx + cfg.size!.width / 2;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(_xPos - 25, 50, _xPos + 25, 42),
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(5.0),
      ),
      _paint,
    );
  }
}
class FirstTabView extends StatelessWidget {
  final ScrollController controller;
  const FirstTabView({
    super.key,
    required this.size, required this.controller,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const SubtitleText(
            title: 'Be the first in your gang to grow up in the ranks'),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoldText(title: 'Rank'),
            BoldText(title: 'Prizes'),
          ],
        ),
        SizedBox(
          height: 450,
          width: size.width - 40,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            scrollDirection: Axis.vertical,
            controller: controller,
            itemCount: UserData.rank.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            height: 30,
                            UserData.badges[index],
                          ),
                          Text(
                            UserData.rank[index],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        UserData.gifts[index],
                                      ),
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    (index == 2) || (index == 3)
                                        ? 'Gold'
                                        : 'Voucher',
                                    style: TextStyle(
                                        color: AppColors().black1,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              Text(
                                UserData.price[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: AppColors().black1.withOpacity(0.3),
                  )
                ],
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(Images().bottomheart),
        )
      ],
    );
  }
}
