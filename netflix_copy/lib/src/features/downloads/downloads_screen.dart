import "package:flutter/material.dart";
import 'package:netflix_copy/src/components/header_widget.dart';
import 'package:netflix_copy/src/features/downloads/movie_catalog_widget.dart';

class Downloads_Screen extends StatefulWidget {
  @override
  State<Downloads_Screen> createState() => Downloads_ScreenState();
}

class Downloads_ScreenState extends State<Downloads_Screen> {
  static const double card_width = 120.0;
  static const double card_height = 160.0;
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            header_widget(
              screen_width: screen_width,
              isNetflixIconShow: false,
              title: "Downloads",
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
                  Icon(
                    Icons.settings,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Smart Downloads",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            subheader_and_description_widget(),
            movie_catalog_widget(
                card_width: card_width, card_height: card_height),
            const SizedBox(
              height: 50,
            ),
            control_widget(),
          ],
        ),
      ),
    );
  }

  Column control_widget() {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(80, 104, 220, 1)),
            ),
            onPressed: () {},
            child: const Text(
              "Set Up",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
            ),
            onPressed: () {},
            child: const Text(
              "See What You Can Download",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column subheader_and_description_widget() {
    return Column(
      children: const [
        Text(
          "Introducing Downloads for You",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          child: Text(
            "We'll download a personalised selection of movies and shows for you, so there's always something to watch on your device.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
