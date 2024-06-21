// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/core/theming/text_styel_manger.dart';

class MoviesSectionsName extends StatelessWidget {
  final String name;
  const MoviesSectionsName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
      child: Row(
        children: [
          Text(name, style: TextStyelManger.font20WhiteBold),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.view_agenda_rounded,
                color: ColorsManger.white,
              ))
        ],
      ),
    );
  }
}
