import "package:flutter/material.dart";
import 'package:netflix_copy/src/components/header_widget.dart';

class Downloads_Screen extends StatefulWidget {
  @override
  State<Downloads_Screen> createState() => Downloads_ScreenState();
}

class Downloads_ScreenState extends State<Downloads_Screen> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            header_widget(
              screen_width: screen_width,
              isNetflixIconShow: false,
              title: "Downloads",
            ),
          ],
        ),
      ),
    );
  }
}
