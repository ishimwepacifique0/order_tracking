import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:order/components/stars.dart';
import 'package:order/components/widgets/colorButton.dart';
import 'package:order/language/locale.dart';
import 'package:order/screens/home/navigationHome.dart';
import 'package:order/theme/colors.dart';

class EndTripPoolTaker extends StatefulWidget {
  @override
  _EndTripPoolTakerState createState() => _EndTripPoolTakerState();
}

class _EndTripPoolTakerState extends State<EndTripPoolTaker> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            FadedScaleAnimation(
              child: Container(
                width: 220,
                child: Image.asset("assets/img_tripcomplete.png"),
              ),
              scaleDuration: const Duration(milliseconds: 600),
            ),
            SizedBox(
              height: 40,
            ),
            Text(locale.tripCompleted!,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 22)),
            SizedBox(
              height: 10,
            ),
            Text(
              locale.hopeYouHad!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                  ),
            ),
            Spacer(),
            FadedSlideAnimation(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(locale.rateRider!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 13.5,
                                          color: Color(0xffa3bccf))),
                              Text("Samantha Smith",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 17))
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 60,
                            child: Image.asset("assets/profiles/img1.png"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stars(),
                    ),
                    Divider(
                      thickness: 7,
                      color: Colors.grey[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Text(locale.amountToPay!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 13.5,
                                      color: Color(0xffa3bccf))),
                          Spacer(),
                          Text("\$24.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 20))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationHome()));
                          },
                          child: FadedScaleAnimation(
                            child: ColorButton(locale.submitPay),
                            scaleDuration: const Duration(milliseconds: 600),
                          )),
                    )
                  ],
                ),
              ),
              beginOffset: Offset(0, 0.4),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            )
          ],
        ),
      ),
    );
  }
}
