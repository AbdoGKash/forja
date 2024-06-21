import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/helper/app_strings.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/features/home/logic/cubit/home_cubit.dart';
import 'widgets/foryou_sections.dart';
import 'widgets/movies_sections.dart';

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
                    MoviesSections(
                      movies: moviceAction!,
                      itemCount: moviceAction.length,
                      name: AppStrings.action,
                    ),
                    MoviesSections(
                      movies: moviceComedy!,
                      itemCount: moviceComedy.length,
                      name: AppStrings.comedy,
                    ),
                    MoviesSections(
                      movies: moviceRomantic!,
                      itemCount: moviceRomantic.length,
                      name: AppStrings.romantic,
                    ),
                    MoviesSections(
                      movies: moviceAnimation!,
                      itemCount: moviceAnimation.length,
                      name: AppStrings.animation,
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
