import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

class AboutButton extends StatelessWidget {
  final String text;
  final  void Function()? onPress;
  final bool isColoredButton;
   AboutButton(
      { this.isColoredButton = false, this.onPress, required this.text});


  @override
  Widget build(BuildContext context) {
    return Material(
      color: isColoredButton ? AppColor.pColor : Colors.transparent,
      child: InkWell(
        highlightColor: Colors.grey,
        onTap: onPress,
        child: Container(
          height: 39,
          width: 139,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              text,
              style: isColoredButton
                  ? AppTextStyle.body16
                  : AppTextStyle.body16.apply(color: Colors.white38),
            ),
          ),
        ),
      ),
    );
  }
}
