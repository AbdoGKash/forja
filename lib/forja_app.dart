import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/routing/app_router.dart';
import 'package:forja/core/routing/routers_name.dart';

class ForjaApp extends StatelessWidget {
  const ForjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutersName.homeSreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
