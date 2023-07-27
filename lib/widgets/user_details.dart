import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/images.dart';

class UserDetails extends StatelessWidget {
  final bool isUser;
  final String name;
  final String score;
  final int rank;
  final String image;
  const UserDetails({
    super.key,
    this.isUser = false,
    required this.name,
    required this.score,
    required this.rank,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin:
          isUser ? const EdgeInsets.only() : const EdgeInsets.only(bottom: 10),
      height: 70,
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          isUser
              ? const BoxShadow(
                  blurRadius: 10,
                  color: Colors.black26,
                  spreadRadius: 6,
                  offset: Offset(0, 0))
              : const BoxShadow()
        ],
        color: AppColors().pink2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    rank.toString(),
                    style: const TextStyle(
                      //color: AppColors().white3,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkResponse(
                    child: Image.asset(
                      (rank == 5 || rank == 6 || rank == 8 || rank == 9)
                          ? Images().polygonGreen
                          : Images().polygonRed,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 70,
                height: 65,
                child: Stack(
                  children: [
                    Center(child: Image.asset(image)),
                    isUser
                        ? Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(Images().rightIcon),
                          )
                        : Positioned(
                            right: 0,
                            bottom: 0,
                            child: (rank == 4 || rank == 7 || rank == 8)
                                ? Image.asset(Images().rightIcon)
                                : Container(),
                          ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(name),
            ],
          ),
          Text(
            score,
            style: const TextStyle(fontSize: 27),
          ),
        ],
      ),
    );
  }
}
