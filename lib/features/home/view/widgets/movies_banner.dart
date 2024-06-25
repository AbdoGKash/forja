import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/model/movies_model.dart';
import 'foryou_sections.dart';

class MoviesBanner extends StatelessWidget {
  final List<MoviesDetails> moviesForYou;
  const MoviesBanner({super.key, required this.moviesForYou});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 2,
          autoPlay: true,
          viewportFraction: 1,
          enableInfiniteScroll: true),
      items: [
        for (int i = 0; i < moviesForYou.length; i++)
          ForyouSections(
            moviesCover: moviesForYou[i].cover.toString(),
            moviesName: moviesForYou[i].name.toString(),
            moviesRating: moviesForYou[i].rating.toString(),
          ),
      ],
    );
  }
}
