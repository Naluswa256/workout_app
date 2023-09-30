import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

class BodyText extends StatelessWidget {
  final String bodyTxt;
  final String desc;
  final bool isBold;

  const BodyText(
      {
      this.isBold = false,
      required this.bodyTxt,
      required this.desc});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bodyTxt,
            style: isBold
                ? AppTextStyle.headline50
                : TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            style: TextStyle(fontFamily: 'Euclid', fontSize: 15),
          )
        ],
      ),
    );
  }
}
