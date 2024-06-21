import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/helper/app_strings.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/features/home/logic/cubit/home_cubit.dart';

import 'widgets/foryou_sections.dart';
import 'widgets/movies_sections.dart';
import 'widgets/movies_sections_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is LoadingState || current is LoadedState,
          builder: (context, state) {
            if (state is LoadingState) {
              return Padding(
                padding: const EdgeInsets.all(150.0).w,
                child: Center(
                    child: CircularProgressIndicator(
                  color: ColorsManger.yellow,
                )),
              );
            } else if (state is LoadedState) {
              var moviceForYou = state.movice.foryou;
              var moviceAction = state.movice.action;
              var moviceComedy = state.movice.comedy;
              var moviceRomantic = state.movice.romantic;
              var moviceAnimation = state.movice.animation;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ForyouSections(
                      moviesCover: moviceForYou![0].cover.toString(),
                      moviesName: moviceForYou[0].name.toString(),
                      moviesRating: moviceForYou[0].rating.toString(),
                    ),
                    const MoviesSectionsName(
                      name: AppStrings.action,
                    ),
                    MoviesSections(
                      movice: moviceAction!,
                      itemCount: moviceAction.length,
                    ),
                    const MoviesSectionsName(
                      name: AppStrings.comedy,
                    ),
                    MoviesSections(
                      movice: moviceComedy!,
                      itemCount: moviceComedy.length,
                    ),
                    const MoviesSectionsName(
                      name: AppStrings.romantic,
                    ),
                    MoviesSections(
                      movice: moviceRomantic!,
                      itemCount: moviceRomantic.length,
                    ),
                    const MoviesSectionsName(
                      name: AppStrings.animation,
                    ),
                    MoviesSections(
                      movice: moviceAnimation!,
                      itemCount: moviceAnimation.length,
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
