import 'package:flutter/material.dart';

import '../../../../core/theming/color_manger.dart';

class Point extends StatelessWidget {
  const Point({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
            color: ColorsManger.yellow,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
