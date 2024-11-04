import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:order/language/locale.dart';
import 'package:order/screens/home/chats/chats.dart';
import 'package:order/screens/home/home/home.dart';
import 'package:order/screens/home/more/more.dart';
import 'package:order/screens/home/myTrips/myTrips.dart';
import 'package:order/theme/colors.dart';

class NavigationHome extends StatefulWidget {
  final int currentIndex;

  NavigationHome([this.currentIndex = 0]);

  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  final List<Widget> _children = [
    Home(),
    MyTrips(),
    Chats(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 17,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black, fontSize: 10),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black, fontSize: 10),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              label: locale.home,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation(
                  child: Icon(Icons.drive_eta),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
          BottomNavigationBarItem(
              label: locale.myTrips,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation(
                  child: Icon(Icons.navigation),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
          BottomNavigationBarItem(
              label: locale.chats,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation(
                  child: Icon(Icons.chat),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
          BottomNavigationBarItem(
              label: locale.more,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: FadedScaleAnimation(
                  child: Icon(
                    Icons.more_horiz,
                  ),
                  scaleDuration: const Duration(milliseconds: 500),
                ),
              )),
        ],
      ),
    );
  }
}
