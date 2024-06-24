import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routers_name.dart';
import '../../../home/data/model/movies_model.dart';

class ViewListMovies extends StatelessWidget {
  final List<MoviesDetails>? movies;
  const ViewListMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: movies!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0).w,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutersName.moviseDetailsScreen,
                  arguments: movies![index],
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(movies![index].cover.toString()),
              ),
            ),
          );
        });
  }
}
