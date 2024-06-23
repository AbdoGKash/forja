import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forja/core/injection.dart';
import 'package:forja/core/routing/routers_name.dart';
import 'package:forja/features/home/logic/cubit/home_cubit.dart';
import 'package:forja/features/home/view/home_screen.dart';
import 'package:forja/features/list_movice/view/list_movise_screen.dart';

import '../../features/home/data/model/movies_model.dart';
import '../../features/otp/otp_screen.dart';
import '../../features/phone_auth/view/phone_auth_screen.dart';

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
      case RoutersName.listMoviseScreen:
        final movies = settings.arguments as List<MoviesDetails>;
        return MaterialPageRoute(
          builder: (_) => ListMoviseScreen(
            movies: movies,
          ),
        );
      case RoutersName.authSreen:
        return MaterialPageRoute(
          builder: (_) => PhoneAuthScreen(),
        );
      case RoutersName.otpSreen:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
        );
      // case RoutersName.moviseDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const MoviseDetailsScreen(),
      //   );
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
