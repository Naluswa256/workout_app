import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/style/text.dart';
import 'package:workout_app/views/app.dart';
import 'package:workout_app/views/questions_screen.dart';
import 'package:workout_app/widget/aboutCard.dart';
import 'package:workout_app/widget/about_button.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/header.dart';
import 'package:flutter_scale_ruler/flutter_scale_ruler.dart';

import '../src/features/authentication/domain/usecases/update_userprofile_usecase.dart';
class HeightScreen extends StatefulWidget {
  String uid;
  HeightScreen({required this.uid});
  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  ScaleValue? _scaleValue;
  final userProfileUseCases = UserProfileUseCases();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
                child: Image.asset(
                  'assets/images/welcome.png',
                  fit: BoxFit.fill,
                )),
            Container(color: AppColor.sColor.withOpacity(0.8)),
            Column(
              children: [
                const SizedBox(height:60),
                Padding(
                  padding: const EdgeInsets.only(left:16),
                  child: Text(height,style: AppTextStyle.headline32.copyWith(fontSize: 23),),
                ),
                Container(
                  height: 200.0,
                  alignment: Alignment.center,
                  child: Text(
                    "${_scaleValue?.cms ?? "0"} Cms",
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500,),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ScaleRuler.lengthMeasurement(
                   sliderActiveColor: AppColor.pColor,
                    backgroundColor: AppColor.tColor,
                    sliderInactiveColor: AppColor.sColor,
                    maxValue: 8,
                    minValue: 2,
                    //isFeet: true,
                    stepIndicatorColor: Colors.white,
                    stepIndicatorDividerColor: Colors.blue,
                    onChanged: (ScaleValue? scaleValue) {
                      setState(() {
                        _scaleValue = scaleValue;
                      });
                    },
                  ),
                ),

                const Expanded(child:SizedBox()),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right:16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AboutButton(
                            isColoredButton: true,
                            text: abody5,
                            onPress: () async{
                              final updatedFields = {
                                'userHeight': _scaleValue?.cms!.toString(), // Replace with your updated fields
                              };

                              // Call the use case to update and navigate
                              await userProfileUseCases.updateAndNavigateToScreen(
                                context: context,
                                uid: widget.uid,
                                updatedFields: updatedFields, routePath: '/questions/${widget.uid}',
                              );
                            })
                      ],
                    ),
                  ),
                ),
                const SizedBox(height:25)
              ],
            )
          ],
        ));
  }
}
