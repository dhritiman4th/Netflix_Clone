import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/src/components/header_widget.dart';
import 'package:netflix_clone/src/features/home/control_widget.dart';
import 'package:netflix_clone/src/features/home/highlighted_movie_widget.dart';
import 'package:netflix_clone/src/features/home/home_header.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/src/features/home/movie_list_with_controls.dart';
import 'package:netflix_clone/src/features/home/movie_list_without_constrols.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => Home_ScreenState();
}

class Home_ScreenState extends State<Home_Screen> {
  final ScrollController scroll_controller = ScrollController();
  bool is_expand = true;
  bool header_should_blur = true;
  static const IconData ellipsis_v =
      IconData(0xf142, fontFamily: 'MyFlutterApp', fontPackage: null);

  @override
  void initState() {
    super.initState();
    scroll_controller.addListener(() {});
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {});
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    if (scroll_controller.position.pixels == 0) {
      setState(() {
        header_should_blur = true;
      });
    } else {
      setState(() {
        header_should_blur = false;
      });
    }
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: screen_height,
            width: screen_width,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is UserScrollNotification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.forward) {
                    print("FORWARD.....");
                    setState(() {
                      is_expand = true;
                    });
                  } else if (direction == ScrollDirection.reverse) {
                    print("BACKWARD.....");
                    setState(() {
                      is_expand = false;
                    });
                  }
                }

                if (notification is ScrollStartNotification) {
                  _onStartScroll(notification.metrics);
                } else if (notification is ScrollUpdateNotification) {
                  _onUpdateScroll(notification.metrics);
                } else if (notification is ScrollEndNotification) {
                  _onEndScroll(notification.metrics);
                }

                return true;
              },
              child: SingleChildScrollView(
                controller: scroll_controller,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    highlighted_movie_widget(
                        screen_width: screen_width,
                        screen_height: screen_height),
                    control_widget(screen_width: screen_width),
                    const SizedBox(
                      height: 10,
                    ),
                    const movie_list_without_constrols(
                      section_title: "Recently Added",
                      card_width: 100,
                      card_height: 170,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const movie_list_with_controls(
                      ellipsis_v: ellipsis_v,
                      section_title: "Continue watching for Tony",
                      card_height: 180,
                      card_width: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const movie_list_without_constrols(
                      section_title: "Trending Now",
                      card_width: 100,
                      card_height: 140,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const movie_list_without_constrols(
                      section_title: "My List",
                      card_width: 100,
                      card_height: 140,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            child: home_header(screen_width: screen_width),
            duration: Duration(milliseconds: 100),
            bottom: is_expand ? screen_height - 230 : screen_height,
          ),
          header_widget(
            screen_width: screen_width,
            isNetflixIconShow: true,
            should_blur: header_should_blur,
          ),
        ],
      ),
    );
  }
}
