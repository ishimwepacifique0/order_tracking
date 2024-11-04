import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:order/components/widgets/colorButton.dart';
import 'package:order/components/widgets/textField.dart';
import 'package:order/language/locale.dart';
import 'package:order/theme/colors.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      locale.support!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 22),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      locale.connectUs!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: 42,
                    ),
                    FadedScaleAnimation(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        child: Image.asset("assets/head_support.png"),
                      ),
                      scaleDuration: const Duration(milliseconds: 600),
                    ),
                  ],
                )
              ],
            ),
          ),
          FadedSlideAnimation(
            child: Stack(alignment: Alignment.bottomCenter, children: [
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.7,
              //   decoration: BoxDecoration(
              //       color: primaryColor,
              //       borderRadius: BorderRadius.circular(20)),
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.call,
              //                 color: Colors.white,
              //                 size: 20,
              //               ),
              //               SizedBox(
              //                 width: 20,
              //               ),
              //               Text(
              //                 locale.callUs!,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge!
              //                     .copyWith(color: Colors.white, fontSize: 14),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Spacer(),
              //         Container(
              //           height: 40,
              //           child: VerticalDivider(
              //             color: Colors.white,
              //           ),
              //         ),
              //         Spacer(),
              //         Container(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.email,
              //                 color: Colors.white,
              //                 size: 20,
              //               ),
              //               SizedBox(
              //                 width: 20,
              //               ),
              //               Text(
              //                 locale.mailUs!,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge!
              //                     .copyWith(color: Colors.white, fontSize: 14),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.71,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              locale.addIssueFeedback ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 14),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            // Text(
                            //   locale.letUsKnowQuery!,
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .bodyMedium!
                            //       .copyWith(
                            //           fontSize: 15, color: Color(0xffb3b3b3)),
                            // ),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            EntryField(
                              '',
                              locale.writeyourMessage,
                              false,
                              maxLines: 4,
                            ),
                            // EntryField(
                            //     locale.addYourIssue! + "/" + locale.feedback!,
                            //     locale.addYourMessage,
                            //     false)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ))
            ]),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            start: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FadedScaleAnimation(
                    child: ColorButton(locale.submit),
                    scaleDuration: const Duration(milliseconds: 600),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
