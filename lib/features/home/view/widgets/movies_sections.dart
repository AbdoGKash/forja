import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/movies_model.dart';

class MoviesSections extends StatelessWidget {
  final List<MoviesDetails> movice;
  final int itemCount;
  const MoviesSections(
      {super.key, required this.movice, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0).w,
            child: InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  movice[index].cover.toString(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
