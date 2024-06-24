import 'package:flutter/material.dart';

import '../../../../core/theming/color_manger.dart';

class AddAndShareAndPromo extends StatelessWidget {
  const AddAndShareAndPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.my_library_add,
                  color: ColorsManger.yellow,
                )),
            SizedBox(
              height: 10,
            ),
            Text("add", style: TextStyle(color: Colors.white))
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: ColorsManger.yellow,
                )),
            SizedBox(
              height: 10,
            ),
            Text("share", style: TextStyle(color: Colors.white))
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.video_library,
                  color: ColorsManger.yellow,
                )),
            SizedBox(
              height: 10,
            ),
            Text("promo", style: TextStyle(color: Colors.white))
          ],
        ),
      ],
    );
  }
}
