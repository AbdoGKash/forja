import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/helper/app_strings.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/core/theming/text_styel_manger.dart';
import 'package:forja/features/home/data/model/movies_model.dart';

class ListMoviseScreen extends StatelessWidget {
  final List<MoviesDetails> movies;
  const ListMoviseScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManger.black,
        appBar: _appBar(),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0).w,
                    child: InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movies[index].cover.toString(),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: ColorsManger.black,
      title: Text(
        AppStrings.movies,
        style: TextStyelManger.font20WhiteBold,
      ),
      centerTitle: true,
      foregroundColor: ColorsManger.white,
    );
  }
}
