import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselWidget extends StatelessWidget {
  List list;
  double height;
  BoxDecoration decoration;
  List<Widget> children;
  dynamic element;

  CustomCarouselWidget({Key? key, required this.list, required this.height, required this.decoration, required this.children}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
            items: list.map((element) => Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: height,
                    decoration: decoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: children,
                         
                    ),
                  ),
                ),
              ],
            )).toList(),
            options: CarouselOptions(
              height: 100,
              viewportFraction: 0.2,
              enlargeCenterPage: false,
              autoPlay: false,
              aspectRatio: 2.0,
              initialPage: 2,
              scrollDirection: Axis.vertical,
              enableInfiniteScroll: false,
              scrollPhysics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
            ),
          );
  }
}