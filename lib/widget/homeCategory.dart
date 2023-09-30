import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

class HomeCategory extends StatelessWidget {
  final String categoryName;
  const HomeCategory({ required this.categoryName,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(PadRadius.radius),
                  border: Border.all(color: AppColor.pColor)),
          child: Icon(Icons.verified_user_outlined, size:24)
        ),
        const SizedBox(height:2),
        Center(
          child: Text(
            categoryName,
            style: AppTextStyle.body12,
          ),
        ),
      ],
    );
  }
}
