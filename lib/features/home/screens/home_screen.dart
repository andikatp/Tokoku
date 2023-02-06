import 'package:amazon/features/home/widgets/address_box.dart';
import 'package:amazon/features/home/widgets/carousel_image.dart';
import 'package:amazon/features/home/widgets/deal_ofthe_day.dart';
import 'package:amazon/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBox(),
            TopCategories(),
            CarouselImages(),
            DealOfTheDay(),
          ],
        ),
      ),
    );
  }
}
