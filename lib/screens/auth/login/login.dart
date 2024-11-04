import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:order/components/widgets/colorButton.dart';
import 'package:order/components/widgets/textField.dart';
import 'package:order/language/locale.dart';
import 'package:order/screens/home/navigationHome.dart';
import 'package:order/theme/colors.dart';

import 'login_interactor.dart';

class Login extends StatefulWidget {
  final LoginInteractor loginInteractor;

  Login(this.loginInteractor);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: backgroundColor,
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: FadedScaleAnimation(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Image.asset(
                          "assets/logo.png",
                          height: 100,
                          scale: 3.5,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      scaleDuration: const Duration(milliseconds: 600),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/img_footer.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          locale.signInNow!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 15),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        EntryField(locale.phoneNumber, locale.enterMobileNumber,
                            false),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Register()));
                              widget.loginInteractor
                                  .loginWithPhone('isoCode', 'mobileNumber');
                            },
                            child: FadedScaleAnimation(
                              child: ColorButton(locale.continuee),
                              scaleDuration: const Duration(milliseconds: 600),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    locale.orContinueWith!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NavigationHome()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Image.asset("assets/ic_facebok.png"),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    locale.facebook!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(color: Colors.white),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NavigationHome()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Image.asset("assets/ic_google.png"),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    locale.google!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
