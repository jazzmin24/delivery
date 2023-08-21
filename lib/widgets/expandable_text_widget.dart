import 'package:flutter/material.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf; //based on whatever the text we'LL get
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimentions.screenHeight / 5.63;
  //little more than height:100

  @override
  void initState() {
    super.initState();
    //if height exceeds than split the txt
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      //agr text is not tht large
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              color: AppColors.paracolor,
              size: Dimentions.font16,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                    height: 1.8,
                    color: AppColors.paracolor,
                    size: Dimentions.font16,
                    text: hiddenText
                        ? (firstHalf + "...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? 'Show more' : 'Show less',
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
