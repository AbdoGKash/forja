import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/theming/text_styel_manger.dart';

import '../../../../core/theming/color_manger.dart';

class ForyouSections extends StatelessWidget {
  final String moviesCover;
  final String moviesName;
  final String moviesRating;
  const ForyouSections(
      {super.key,
      required this.moviesCover,
      required this.moviesName,
      required this.moviesRating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(color: ColorsManger.black),
          child: Image.network(
            moviesCover,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 130.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsManger.black.withOpacity(0),
                    ColorsManger.black
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      moviesName,
                      style: TextStyelManger.font16White,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorsManger.yellow,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          moviesRating,
                          style: TextStyelManger.font14White,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
