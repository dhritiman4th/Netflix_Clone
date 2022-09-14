import 'package:flutter/material.dart';

class highlighted_movie_widget extends StatelessWidget {
  const highlighted_movie_widget({
    Key? key,
    required this.screen_width,
    required this.screen_height,
  }) : super(key: key);

  final double screen_width;
  final double screen_height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            width: screen_width,
            height: screen_height * 0.6,
            child: Image.asset(
              "assets/images/top-gun-poster.jpg",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            width: screen_width,
            height: screen_height * 0.6,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.4),
                  Colors.transparent,
                  Color.fromRGBO(0, 0, 0, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}
