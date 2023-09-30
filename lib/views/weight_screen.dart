import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/style/text.dart';
import 'package:workout_app/views/app.dart';
import 'package:workout_app/views/height_screen.dart';
import 'package:workout_app/widget/aboutCard.dart';
import 'package:workout_app/widget/about_button.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/header.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../src/features/authentication/domain/usecases/update_userprofile_usecase.dart';
class WeightScreen extends StatefulWidget {
 final  String uid;
 WeightScreen({required this.uid});
  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  late WeightSliderController _controller;
  double _weight = 30.0;
  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
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
                Text(weight, style: AppTextStyle.headline32.copyWith(fontSize: 23),),
                Container(
                  height: 200.0,
                  alignment: Alignment.center,
                  child: Text(
                    "${_weight.toStringAsFixed(1)} kg",
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500, color: AppColor.pColor,),
                  ),
                ),
                VerticalWeightSlider(
                  controller: _controller,
                  decoration: const PointerDecoration(
                    width: 130.0,
                    height: 3.0,
                    largeColor: Color(0xFF898989),
                    mediumColor: Color(0xFFC5C5C5),
                    smallColor: Color(0xFFF0F0F0),
                    gap: 30.0,
                  ),
                  onChanged: (double value) {
                    setState(() {
                      _weight = value;
                    });
                  },
                  indicator: Container(
                    height: 3.0,
                    width: 200.0,
                    alignment: Alignment.centerLeft,
                    color: Colors.red[300],
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
                                'userWeight': _weight.toStringAsFixed(1), // Replace with your updated fields
                              };

                              // Call the use case to update and navigate
                              await userProfileUseCases.updateAndNavigateToScreen(
                                context: context,
                                uid: widget.uid,
                                updatedFields: updatedFields, routePath: '/height/${widget.uid}',
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
