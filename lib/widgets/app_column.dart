import 'package:flutter/material.dart';
import 'package:delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimentions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimentions.font26,
        ),
        SizedBox(
          height: Dimentions.height10,
        ),
        Row(
          children: [
            //to draw the same widget again and again
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '1297'),
            SizedBox(
              width: 10,
            ),
            SmallText(text: 'comments'),
          ],
        ),
        SizedBox(
          height: Dimentions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //since we are using these icons again and again so lets make it a widget
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1),

            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.7 km',
                iconColor: AppColors.mainColor),

            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32 min',
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
