import 'package:amazon/features/admin/screens/product_screen.dart';
import 'package:flutter/material.dart';
import '../../../constant/global_variable.dart';
import '../widgets/app_bar_widget.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = '/admin-screen';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  final double _bottomBarWidth = 42;
  final double _bottomBarBorderWidth = 5;
  final List<Widget> _pages = [
    const Center(
      child: Text('Analytics Page'),
    ),
    const ProductScreen(),
    const Center(
      child: Text('Cart Page'),
    ),
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
      icon: container,
      label: '',
    );
  }

  void _changePage(int value) => setState(() => _page = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(),
      ),
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
          bottomNavBarItem(Icons.analytics_outlined, 1),
          bottomNavBarItem(Icons.all_inbox_outlined, 2),
        ],
      ),
      body: _pages[_page],
    );
  }
}
