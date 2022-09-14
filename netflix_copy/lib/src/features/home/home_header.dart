import 'package:flutter/material.dart';

class home_header extends StatefulWidget {
  final double screen_width;

  home_header({
    Key? key,
    required this.screen_width,
  }) : super(key: key);

  @override
  State<home_header> createState() => home_header_state();
}

class home_header_state extends State<home_header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screen_width,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              print("hhhhhh");
            },
            child: const Text(
              "TV Shows",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {},
            child: const Text(
              "Movies",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  size: 24.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
