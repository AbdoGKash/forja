import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forja/core/injection.dart';
import 'package:forja/core/routing/routers_name.dart';
import 'package:forja/features/home/logic/cubit/home_cubit.dart';
import 'package:forja/features/home/view/home_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersName.homeSreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..moviceData(),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          ),
        );
    }
  }
}
