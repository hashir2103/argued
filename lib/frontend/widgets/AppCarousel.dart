import 'package:argued/frontend/widgets/AppCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class AppCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(color: primaryColor),
                child: AppCard2()
                );
          },
        );
      }).toList(),
    );
  }
}
