import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:order/components/widgets/colorButton.dart';
import 'package:order/components/widgets/textField.dart';
import 'package:order/language/locale.dart';
import 'package:order/theme/colors.dart';

import 'verification_interator.dart';

class Verification extends StatefulWidget {
  final VerificationInteractor verificationInteractor;
  Verification(this.verificationInteractor);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    super.initState();
    widget.verificationInteractor.verifyNumber();
  }

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
            color: backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      locale.verification!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      locale.inLessThanAmin!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: FadedScaleAnimation( child:
                    Container(
                      child: Image.asset("assets/img_verification.png"),
                    ),
                    scaleDuration: const Duration(milliseconds: 600),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    locale.enterVerificationCodeWeveSent!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  EntryField(locale.enterCode, locale.enter6digit, false),
                  // Spacer(),
                  GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NavigationHome()));
                        widget.verificationInteractor.verificationDone();
                      },
                      child: FadedScaleAnimation( child:
                        ColorButton(locale.getStarted),
                        scaleDuration: const Duration(milliseconds: 600),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
