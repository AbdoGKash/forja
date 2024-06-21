import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          moviesRating, // From API
                          style: TextStyle(color: Colors.white),
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
