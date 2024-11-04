import 'dart:io';

import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:order/language/locale.dart';
import 'package:order/screens/home/myTrips/listOfPoolersScreen.dart';
import 'package:order/screens/home/myTrips/poolTakerRequestScreen.dart';
import 'package:order/screens/home/myTrips/poolerInfo.dart';
import 'package:order/theme/colors.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyTrips extends StatefulWidget {
  @override
  _MyTripsState createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {

  final List imgs = [
    "assets/profiles/img1.png",
    "assets/profiles/img2.png",
    "assets/profiles/img3.png",
    "assets/profiles/img4.png",
    "assets/profiles/img5.png"
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            locale.myTrips!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.grey[300],
                size: 17,
              ),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 4.0,
            tabs: [
              Tab(
                text: locale.offering,
              ),
              Tab(
                text: locale.finding,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            OfferingTab(
              imgs: imgs,
            ),
            FindingTab(
              imgs: imgs,
            ),
          ],
        ),
      ),
    );
  }
}

class OfferingTab extends StatelessWidget {
  const OfferingTab({
    Key? key,
    required this.imgs,
  }) : super(key: key);

  final List imgs;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: FadedSlideAnimation(
        child: Column(
          children: [
            // if (_anchoredBanner != null)
            //   Container(
            //     width: _anchoredBanner!.size.width.toDouble(),
            //     height: _anchoredBanner!.size.height.toDouble(),
            //     child: AdWidget(ad: _anchoredBanner!),
            //   ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => TripPoolerInfo(imgs[0],
                      //             "Sam Smith", index % 2 == 0 ? true : false)));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PoolTakerRequestScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("${index + 1}:30 am",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(fontSize: 13.5)),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "${DateTime.now().add(
                                                  Duration(days: index),
                                                ).day} March, 2024",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.grey[300],
                                          size: 5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Hamilton Bridge, New York",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 10)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey[400],
                                      size: 10,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey[300],
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Trade Bridge, New York",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 10)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                            height: 130,
                          ),
                          Column(
                            children: [
                              SizedBox(height: 8),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                  ),
                                  itemBuilder: (context, gridIndex) {
                                    return Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffd9e3ea),
                                            backgroundImage:
                                                index % 4 != 0 || gridIndex <= 1
                                                    ? AssetImage(
                                                        'assets/profiles/img${gridIndex + 1}.png',
                                                      )
                                                    : null,
                                            child: index % 4 == 0 &&
                                                    !(gridIndex <= 1)
                                                ? Icon(
                                                    Icons.person,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                    size: 18,
                                                  )
                                                : null,
                                          ),
                                        ),
                                        if (index % 4 != 0 || gridIndex <= 1)
                                          Icon(
                                            Icons.check_circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 14,
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                height: 40,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.05),
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(8),
                                  ),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        end: 6.0,
                                        top: 2.0,
                                        start: 4.0,
                                      ),
                                      child: Text(
                                        index % 4 == 0
                                            ? locale?.requests ?? ''
                                            : locale?.passengers ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontSize: 10,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                    ),
                                    if (index % 4 == 0)
                                      CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Text(
                                          '2',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(fontSize: 8),
                                        ),
                                        radius: 6,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        beginOffset: Offset(0.4, 0),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class FindingTab extends StatelessWidget {
  const FindingTab({
    Key? key,
    required this.imgs,
  }) : super(key: key);

  final List imgs;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: FadedSlideAnimation(
        child: Column(
          children: [
            // if (_anchoredBanner != null)
            //   Container(
            //     width: _anchoredBanner!.size.width.toDouble(),
            //     height: _anchoredBanner!.size.height.toDouble(),
            //     child: AdWidget(ad: _anchoredBanner!),
            //   ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => TripPoolerInfo(imgs[0],
                      //             "Sam Smith", index % 2 == 0 ? true : false)));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListOfPoolersScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("${index + 1}:30 am",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(fontSize: 13.5)),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "${DateTime.now().add(
                                                  Duration(days: index),
                                                ).day} March, 2024",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.grey[300],
                                          size: 5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Hamilton Bridge, New York",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 10)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey[400],
                                      size: 10,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey[300],
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Trade Bridge, New York",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 10)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                            height: 130,
                          ),
                          Column(
                            children: [
                              SizedBox(height: 8),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (index % 4 == 0)
                                      CircleAvatar(
                                        radius: 14,
                                        backgroundColor: Color(0xffd9e3ea),
                                        child: Icon(
                                          Icons.local_taxi,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          size: 20,
                                        ),
                                      )
                                    else
                                      Stack(
                                        alignment: AlignmentDirectional.topEnd,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Color(0xffd9e3ea),
                                              backgroundImage: AssetImage(
                                                'assets/profiles/img${(index % 3) + 1}.png',
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.check_circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                height: 40,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffe3ac17).withOpacity(0.05),
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 6.0,
                                    top: 2.0,
                                    start: 4.0,
                                  ),
                                  child: Text(
                                    index % 4 == 0
                                        ? locale?.pending ?? ''
                                        : locale?.accepted ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 10,
                                          color: Color(0xffe3ac17),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        beginOffset: Offset(0.4, 0),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
