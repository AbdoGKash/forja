import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/theming/color_manger.dart';

import '../../../core/theming/text_styel_manger.dart';
import '../../home/data/model/movies_model.dart';
import 'widgets/add_and_share_and_promo.dart';
import 'widgets/custom_buttom.dart';
import 'widgets/point.dart';
import 'widgets/related_and_more.dart';

class MoviseDetailsScreen extends StatelessWidget {
  final MoviesDetails moviesDetails;
  const MoviseDetailsScreen({super.key, required this.moviesDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManger.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(context),
                SizedBox(
                  height: 10.h,
                ),
                const AppTextButton(),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
                  child: const Divider(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const AddAndShareAndPromo(),
                SizedBox(
                  height: 20.h,
                ),
                RelatedAndMore(
                  moviesDetails: moviesDetails,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 500.h,
          decoration: BoxDecoration(color: ColorsManger.black),
          child: Image.network(
            moviesDetails.cover.toString(),
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
            )),
        Positioned.fill(
          bottom: 0,
          child: Container(
            color: ColorsManger.black.withOpacity(0.7),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0).w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      moviesDetails.cover.toString(),
                      width: 100.w,
                      height: 170.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(moviesDetails.name.toString(),
                        style: TextStyelManger.font20WhiteBold),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorsManger.yellow,
                          size: 15.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(moviesDetails.rating.toString(), // From API
                            style: TextStyelManger.font14White),
                        const Point(),
                        Text(
                          moviesDetails.duration.toString(), // From API
                          style: TextStyelManger.font14White,
                        ),
                        const Point(),
                        Text(moviesDetails.section.toString(),
                            style: TextStyelManger.font14White),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "stars : ",
                          style: TextStyelManger.font16White,
                        ),
                        Text(moviesDetails.stars.toString(),
                            style: TextStyelManger.font14White),
                      ],
                    ),
                  ]),
            ))
      ],
    );
  }
}
