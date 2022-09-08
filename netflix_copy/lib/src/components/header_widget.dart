import 'package:flutter/material.dart';

class header_widget extends StatelessWidget {
  header_widget({
    Key? key,
    required this.screen_width,
    required this.isNetflixIconShow,
    this.title = "",
  }) : super(key: key);

  final double screen_width;
  final bool isNetflixIconShow;
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen_width,
      height: 100,
      color: const Color.fromRGBO(1, 1, 1, 0.5),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isNetflixIconShow) ...[
              const Image(
                image: AssetImage("assets/images/netflix_icon.png"),
                fit: BoxFit.contain,
                height: 35,
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: Image.asset("assets/images/cast.png"),
                iconSize: 40,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: Image.asset("assets/images/search.png"),
                iconSize: 40,
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: Image.asset("assets/images/user_icon.png"),
                iconSize: 40,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
