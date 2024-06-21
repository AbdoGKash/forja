import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routers_name.dart';
import '../../../../core/theming/color_manger.dart';
import '../../../../core/theming/text_styel_manger.dart';
import '../../data/model/movies_model.dart';

class MoviesSections extends StatelessWidget {
  final List<MoviesDetails> movies;
  final int itemCount;
  final String name;
  const MoviesSections(
      {super.key,
      required this.movies,
      required this.itemCount,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
          child: Row(
            children: [
              Text(name, style: TextStyelManger.font20WhiteBold),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutersName.listMoviseScreen,
                        arguments: movies);
                  },
                  icon: Icon(
                    Icons.view_agenda_rounded,
                    color: ColorsManger.white,
                  ))
            ],
          ),
        ),
        SizedBox(
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
                      movies[index].cover.toString(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
