import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/injection.dart';
import 'package:forja/core/theming/text_styel_manger.dart';
import 'package:forja/features/home/data/model/movies_model.dart';
import 'package:forja/features/home/logic/cubit/home_cubit.dart';

import '../../../../core/theming/color_manger.dart';

class RelatedAndMore extends StatelessWidget {
  final MoviesDetails moviesDetails;
  const RelatedAndMore({super.key, required this.moviesDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: TabBar(
                tabs: const [
                  Tab(text: "more information"),
                  Tab(text: "Related"),
                ],
                indicatorColor: ColorsManger.yellow,
                indicatorWeight: 2.0,
                labelColor: ColorsManger.white,
                unselectedLabelColor: ColorsManger.gray,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 400,
                width: MediaQuery.sizeOf(context).width,
                constraints: const BoxConstraints(),
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            moviesDetails.year.toString(),
                            style: TextStyelManger.font16White,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(moviesDetails.summary.toString(),
                              style: TextStyelManger.font14White),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Directed by : ",
                                style: TextStyelManger.font16White,
                              ),
                              Text(
                                "Alex Herrald",
                                style: TextStyelManger.font14White,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    BlocProvider(
                      create: (context) => getIt<HomeCubit>()..moviceData(),
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return Padding(
                              padding: const EdgeInsets.all(100.0).w,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: ColorsManger.yellow,
                              )),
                            );
                          } else if (state is LoadedState) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 2 / 3,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1,
                                  ),
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(6.0).w,
                                      child: InkWell(
                                        onTap: () {},
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(state
                                              .movice.action![index].cover
                                              .toString()),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
