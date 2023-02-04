import 'package:amazon/constant/global_variable.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../features/account/screens/account_screen.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom-bar';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  final double _bottomBarWidth = 42;
  final double _bottomBarBorderWidth = 5;
  final List<Widget> _pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart Page'),
    )
  ];

  BottomNavigationBarItem bottomNavBarItem(IconData icon, int num) {
    Widget container = Container(
      width: _bottomBarWidth,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: _page == num
                ? GlobalVariable.selectedNavBarColor
                : GlobalVariable.backgroundColor,
            width: _bottomBarBorderWidth,
          ),
        ),
      ),
      child: Icon(icon),
    );
    return BottomNavigationBarItem(
      icon: num == 2
          ? badges.Badge(
              position: badges.BadgePosition.topEnd(),
              badgeContent: const Text('2'),
              child: container,
            )
          : container,
      label: '',
    );
  }

  void _changePage(int value) => setState(() => _page = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariable.selectedNavBarColor,
          unselectedItemColor: GlobalVariable.unselectedNavBarColor,
          backgroundColor: GlobalVariable.backgroundColor,
          iconSize: 28,
          onTap: _changePage,
          items: [
            //home
            bottomNavBarItem(Icons.home_outlined, 0),
            bottomNavBarItem(Icons.person_outline_outlined, 1),
            bottomNavBarItem(Icons.home_outlined, 2),
          ]),
      body: _pages[_page],
    );
  }
}
