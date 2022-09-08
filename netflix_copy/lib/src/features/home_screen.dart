import "package:flutter/material.dart";
import 'package:netflix_copy/src/components/header_widget.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => Home_ScreenState();
}

class Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: screen_width,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "TV Shows",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextButton(
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
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
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
                // TextButton.icon(
                //   // <-- TextButton
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.arrow_drop_down_sharp,
                //     size: 24.0,
                //     color: Colors.white,
                //   ),
                //   label: const Text(
                //     "Categories",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 14,
                //     ),
                //   ),
                // ),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text(
                //     "Categories",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 14,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          header_widget(
            screen_width: screen_width,
            isNetflixIconShow: true,
          ),
        ],
      ),
    );
  }
}
