import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:netflix_clone/src/components/header_widget.dart';
import 'package:netflix_clone/src/features/new_and_hot/get_widget_offset.dart';

class NewAndHot_Screen extends StatefulWidget {
  @override
  State<NewAndHot_Screen> createState() => NewAndHot_ScreenState();
}

class NewAndHot_ScreenState extends State<NewAndHot_Screen> {
  bool isMenuSelected = false;
  ScrollController scrollController = ScrollController();
  ScrollController categoryScrollController = ScrollController();
  List<double> category_items = [];
  List<double> category_options = [];
  static List<Map<String, dynamic>> header_menu_list = [
    {
      "image_path": "assets/images/popcorn.png",
      "title": "Coming Soon",
      "is_selected": true,
    },
    {
      "image_path": "assets/images/fire.png",
      "title": "Everyone's Watching",
      "is_selected": false,
    },
    {
      "image_path": "assets/images/top_10.png",
      "title": "Top 10 TV Shows",
      "is_selected": false,
    },
    {
      "image_path": "assets/images/top_10.png",
      "title": "Top 10 Movies",
      "is_selected": false,
    },
  ];
  int selected_menu_index = 0;

  @override
  void initState() {
    category_items = List.generate(4, (index) => index.toDouble());
    category_options = List.generate(4, (index) => index.toDouble());
    super.initState();
  }

  _onStartScroll(ScrollMetrics metrics) {
    print("Scroll Start");
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    // print("Scroll Update");
    print("------>${scrollController.offset}");
  }

  _onEndScroll(ScrollMetrics metrics) {
    print("Scroll End");
    if (!isMenuSelected) {
      print("Category items = ${category_items}");

      int index = category_items.lastIndexWhere((element) {
        return scrollController.offset >= element;
      });
      index = index == -1 ? category_items.length - 1 : index;
      print("Index = $index");
      if (selected_menu_index != index) {
        menu_highlighted_on_scroll(index);
      }
    } else {
      isMenuSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          header_widget(
            screen_width: screen_width,
            isNetflixIconShow: false,
            title: "New & Hot",
          ),
          category_options_widget(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _onUpdateScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollEndNotification) {
                  _onEndScroll(scrollNotification.metrics);
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: List.generate(category_items.length, (index) {
                    switch (index) {
                      case 0:
                        return GetWidgetOffset(
                          offset: (Offset offset) {
                            category_items[index] = offset.dy -
                                165; // header_widget's height + category_option_widget's height + sizedbox's height = 165
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: coming_soon_list(),
                          ),
                        );
                      case 1:
                        return GetWidgetOffset(
                          offset: (Offset offset) {
                            category_items[index] = offset.dy - 165;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: everyones_watching_list(),
                          ),
                        );
                      case 2:
                        return GetWidgetOffset(
                          offset: (Offset offset) {
                            category_items[index] = offset.dy - 165;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: top10_tv_shows_list(),
                          ),
                        );
                      case 3:
                        return GetWidgetOffset(
                          offset: (Offset offset) {
                            category_items[index] = offset.dy - 165;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: top10_movies_list(),
                          ),
                        );
                    }
                    return Container();
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column top10_movies_list() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              child: Image.asset(
                header_menu_list[3]["image_path"],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              header_menu_list[3]["title"],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        fetchTest(),
        fetchTest(),
        fetchTest(),
      ],
    );
  }

  Column top10_tv_shows_list() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              child: Image.asset(
                header_menu_list[2]["image_path"],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              header_menu_list[2]["title"],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        fetchTest(),
        fetchTest(),
        fetchTest(),
        fetchTest(),
      ],
    );
  }

  Column everyones_watching_list() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              child: Image.asset(
                header_menu_list[1]["image_path"],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              header_menu_list[1]["title"],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        fetchTest(),
        fetchTest(),
        fetchTest(),
        fetchTest(),
      ],
    );
  }

  Column coming_soon_list() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              // key: COMING_SOON_HEADER_KEY,
              width: 20,
              child: Image.asset(
                header_menu_list[0]["image_path"],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              header_menu_list[0]["title"],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        fetchTest(),
        fetchTest(),
        fetchTest(),
        fetchTest(),
      ],
    );
  }

  SizedBox category_options_widget() {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        controller: categoryScrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String imagePath = header_menu_list[index]["image_path"] as String;
          String title = header_menu_list[index]["title"] as String;
          bool is_selected = header_menu_list[index]["is_selected"];
          return GetWidgetOffset(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.transparent, backgroundColor: is_selected ? Colors.white : Colors.transparent, disabledForegroundColor: Colors.transparent.withOpacity(0.38), disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () => menu_clicked(index),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          color: is_selected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              offset: (Offset offset) {
                category_options[index] = offset.dx;
              });
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 1,
          );
        },
        itemCount: header_menu_list.length,
      ),
    );
  }

  menu_clicked(int index) {
    if (header_menu_list[index]["is_selected"] == true) return;
    isMenuSelected = true;
    setState(() {
      header_menu_list[index]["is_selected"] = true;
      header_menu_list[selected_menu_index]["is_selected"] = false;
    });
    selected_menu_index = index;
    print("ITEM --- $category_items");
    print("SCROLLING --- ${isAllItemsNeedsScrolling()}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.animateTo(
        category_items[index],
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      categoryScrollController.animateTo(
        category_options[index],
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  menu_highlighted_on_scroll(int index) {
    setState(() {
      header_menu_list[index]["is_selected"] = true;
      header_menu_list[selected_menu_index]["is_selected"] = false;
    });
    selected_menu_index = index;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      categoryScrollController.animateTo(
        category_options[index],
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  Column fetchTest() {
    double screen_width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: screen_width,
            // height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "16",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "SEP",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 180,
                          child: Image.asset(
                            "assets/images/top-gun-poster-landscape.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TOPGUN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "RussoOne",
                              ),
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  "Remind me",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  "Info",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Coming on 16 September",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 100,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN's elite graduates on a mission that demands the ultimate sacrifice from those chosen to fly it.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool isAllItemsNeedsScrolling() {
    return !(scrollController.position.maxScrollExtent == 0);
  }
}
