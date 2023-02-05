import 'package:amazon/constant/global_variable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatelessWidget {
  const CarouselImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: GlobalVariable.carouselImages.length,
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: false,
      ),
      itemBuilder: (context, index, realIndex) => Image.network(
        GlobalVariable.carouselImages[index],
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
