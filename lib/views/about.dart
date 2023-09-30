import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/style/text.dart';
import 'package:workout_app/views/weight_screen.dart';
import 'package:workout_app/widget/aboutCard.dart';
import 'package:workout_app/widget/about_button.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/header.dart';
import 'package:go_router/go_router.dart';
import '../src/features/authentication/domain/usecases/update_userprofile_usecase.dart';

class About extends StatefulWidget {

  final String uid;
  About({required this.uid});
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final userProfileUseCases = UserProfileUseCases();
  int selectedCardIndex = -1;
  String selectedCardValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox.expand(
            child: Image.asset(
         'assets/images/about.png',
          fit: BoxFit.fill,
        )),
        Container(color: AppColor.sColor.withOpacity(0.8)),
        Column(
          children: [
            Expanded(flex: 3, child: Header()),
            Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: PadRadius.horizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 6, child: BodyText(bodyTxt: abt, desc: abody)),
                      SizedBox(height: 15),
                      Expanded(
                          flex: 9,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                AboutCard(
                                  txt: abody2,
                                  descText: abody2i,
                                  isSelected: selectedCardIndex == 0,
                                  onSelectionChanged: (selected) {
                                    setState(() {
                                      selectedCardIndex = selected ? 0 : -1;
                                      selectedCardValue = selected ? 'Beginner': '';
                                    });
                                  },
                                ),
                                SizedBox(width: 20),
                                AboutCard(
                                  txt: abody3,
                                  descText: abody3i,
                                  isSelected: selectedCardIndex == 1,
                                  onSelectionChanged: (selected) {
                                    setState(() {
                                      selectedCardIndex = selected ? 1 : -1;
                                      selectedCardValue = selected? 'Intermediate': '';
                                    });
                                  },
                                ),
                                SizedBox(width: 20),
                                AboutCard(
                                  txt: abody6,
                                  descText: abody6i,
                                  isSelected: selectedCardIndex == 2,
                                  onSelectionChanged: (selected) {
                                    setState(() {
                                      selectedCardIndex = selected ? 2 : -1;
                                      selectedCardValue = selected ? 'Pro' : '';
                                    });
                                  },
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AboutButton(
                                  text: abody4,
                                  onPress: () => context.go('/'),
                                ),
                                AboutButton(
                                    isColoredButton: true,
                                    text: abody5,
                                    onPress: ()async{
                                      final updatedFields = {
                                        'userFitnessLevel': selectedCardValue, // Replace with your updated fields
                                      };

                                      // Call the use case to update and navigate
                                      await userProfileUseCases.updateAndNavigateToScreen(
                                        context: context,
                                        uid: widget.uid,
                                        updatedFields: updatedFields, routePath: '/weight/${widget.uid}',
                                      );
                                    })
                              ],
                            ),
                          ))
                    ],
                  ),
                ))
          ],
        )
      ],
    ));
  }
}
