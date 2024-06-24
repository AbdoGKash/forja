import 'package:flutter/material.dart';
import 'package:forja/core/routing/routers_name.dart';
import 'package:forja/core/theming/color_manger.dart';

class AppTextButton extends StatelessWidget {
  final String urlVideo;
  const AppTextButton({
    super.key,
    required this.urlVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 40,
        minWidth: 350,
        onPressed: () {
          Navigator.pushNamed(context, RoutersName.videoPlayerScreen,
              arguments: urlVideo);
        },
        color: ColorsManger.yellow,
        child: const Text(
          "Watch Now",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
