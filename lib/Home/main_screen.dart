import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_holy_quran/Home/adan_screen.dart';

import 'adkar_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 1);
  /// widget list
  final List<Widget> bottomBarPages = [
    const AdkaarScreen(),
    const HomeScreen(),
    const FirstScreen(),


  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        pageController: _pageController,
        color: Colors.white,
        showLabel: false,
        notchColor: Colors.green,
        bottomBarItems: [
           BottomBarItem(
            inActiveItem: Image.asset(
                'assets/images/praying.png',),
            activeItem: Image .asset(
              'assets/images/praying.png',)
          ),
           BottomBarItem(
              inActiveItem: Image.asset(
                'assets/images/koran.png',),
              activeItem: Image .asset(
                'assets/images/koran.png',)
          ),
          BottomBarItem(
            inActiveItem:  Image.asset(
              'assets/images/moon.png',),
            activeItem: Image.asset(
              'assets/images/moon.png',),
          ),

        ],
        onTap: (index) {
          /// control your animation using page controller
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
      )
    );
  }
}
