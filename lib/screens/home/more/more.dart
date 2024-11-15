import 'package:animation_wrappers/animation_wrappers.dart';

import 'package:flutter/material.dart';
import 'package:order/language/locale.dart';
import 'package:order/screens/auth/login_navigator.dart';
import 'package:order/screens/home/more/changeLanguage.dart';
import 'package:order/screens/home/more/faq.dart';
import 'package:order/screens/home/more/manageAddress.dart';
import 'package:order/screens/home/more/privacyPolicy.dart';
import 'package:order/screens/home/more/profile.dart';
import 'package:order/screens/home/more/support.dart';
import 'package:order/screens/home/more/wallet.dart';
import 'package:order/theme/colors.dart';

class More extends StatelessWidget {
  final List icons = [
    // Icons.drive_eta,
    Icons.location_pin,
    Icons.email,
    Icons.clear_all_outlined,
    Icons.language,
    Icons.info,
    Icons.power_settings_new,
  ];
  final List routes = [
    // MyVehicles(),
    ManageAddress(),
    Support(),
    PrivacyPolicy(),
    ChangeLanguage(),
    FAQs(),
    LoginNavigator(),
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List title = [
      // locale.myVehicle,
      locale.manageAddress,
      locale.support,
      locale.privacyPolicy,
      locale.changeLanguage,
      locale.faq,
      locale.logout,
    ];
    List subtitle = [
      // locale.addVehicleinfo,
      locale.presavedAddress,
      locale.connectUsFor,
      locale.knowPrivacy,
      locale.setYourlanguage,
      locale.getYouranswers,
      locale.logout,
    ];

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: ListView(
            // alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                color: backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      locale.account!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfile()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Samantha Smith",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified_user,
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(locale.viewProfile ?? '')
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            FadedScaleAnimation(
                              child: Container(
                                width: 60,
                                child: Image.asset("assets/profiles/img1.png"),
                              ),
                              scaleDuration: const Duration(milliseconds: 600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FadedSlideAnimation(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 320,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 26, right: 20),
                          horizontalTitleGap: 0,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Wallet(),
                                ));
                          },
                          leading: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 20,
                          ),
                          title: Row(
                            children: [
                              Text(
                                locale.wallet!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.white, fontSize: 14),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text("\$159.50"),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 25,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                          subtitle: Text(
                            locale.quickPayments!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      FadedSlideAnimation(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {
                                  if (routes.length - 1 == index) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginNavigator(),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                routes[index]));
                                  }
                                },
                                horizontalTitleGap: 0,
                                leading: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Icon(
                                    icons[index],
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                ),
                                title: Text(
                                  title[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.black, fontSize: 13.5),
                                ),
                                subtitle: Text(subtitle[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 12,
                                            color: Color(0xffb3b3b3))),
                              );
                            },
                          ),
                        ),
                        beginOffset: Offset(0, 0.4),
                        endOffset: Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      ),
                    ],
                  ),
                ),
                beginOffset: Offset(0, 0.4),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
            ],
          ),
        ));
  }
}
