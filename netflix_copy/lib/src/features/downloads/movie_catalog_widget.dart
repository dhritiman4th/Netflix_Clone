import 'package:flutter/material.dart';
import 'dart:math' as math;

class movie_catalog_widget extends StatelessWidget {
  const movie_catalog_widget({
    Key? key,
    required this.card_width,
    required this.card_height,
  }) : super(key: key);

  final double card_width;
  final double card_height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromRGBO(65, 65, 64, 1),
              minRadius: 70,
              maxRadius: 110,
            ),
            Transform.rotate(
              origin: const Offset(50, 105),
              alignment: Alignment.bottomLeft,
              angle: -math.pi / 7.5,
              child: Container(
                width: card_width * 0.85,
                height: card_height * 0.85,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  child: Image.asset(
                    "assets/images/top-gun-poster.jpg",
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                    // color: Colors.white,
                  ),
                ),
              ),
            ),
            Transform.rotate(
              origin: const Offset(-50, 105),
              alignment: Alignment.bottomRight,
              angle: math.pi / 7.5,
              child: Container(
                width: card_width * 0.85,
                height: card_height * 0.85,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  child: Image.asset(
                    "assets/images/top-gun-poster.jpg",
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                    // color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Transform.rotate(
                origin: const Offset(-30, 55),
                angle: 0,
                child: Container(
                  width: card_width,
                  height: card_height,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    child: Image.asset(
                      "assets/images/top-gun-poster.jpg",
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                      // color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
