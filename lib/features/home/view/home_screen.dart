import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forja/features/home/data/model/movice_model.dart';
import 'package:forja/features/home/logic/cubit/home_cubit.dart';

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
              return const Padding(
                padding: EdgeInsets.all(150.0),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.amber,
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
                    _header(context, moviceForYou![0].cover.toString()),
                    _textSection("Action", context),
                    _section(context, moviceAction!.length, moviceAction),
                    _textSection("Comedy", context),
                    _section(context, moviceComedy!.length, moviceComedy),
                    _textSection("Romantic", context),
                    _section(context, moviceRomantic!.length, moviceRomantic),
                    _textSection("Animation", context),
                    _section(context, moviceAnimation!.length, moviceAnimation),
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

  Widget _textSection(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.view_agenda_rounded,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget _section(
      BuildContext context, int itemCount, List<MoviceDetails> movice) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
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

  Widget _header(BuildContext context, String image) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(color: Colors.black),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 130, // .h
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black
                  ], // ColorsManger.black
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Movice Name", // From API
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
                          "9.5", // From API
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
