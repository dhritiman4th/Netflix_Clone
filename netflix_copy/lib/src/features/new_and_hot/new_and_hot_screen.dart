import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:netflix_clone/src/components/header_widget.dart';

class NewAndHot_Screen extends StatefulWidget {
  @override
  State<NewAndHot_Screen> createState() => NewAndHot_ScreenState();
}

class NewAndHot_ScreenState extends State<NewAndHot_Screen> {
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
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
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
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
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
                const SizedBox(
                  height: 30,
                ),
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
                const SizedBox(
                  height: 30,
                ),
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
                const SizedBox(
                  height: 30,
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox category_options_widget() {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String imagePath = header_menu_list[index]["image_path"] as String;
          String title = header_menu_list[index]["title"] as String;
          bool is_selected = header_menu_list[index]["is_selected"];
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              primary: is_selected ? Colors.white : Colors.transparent,
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
          );
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
    setState(() {
      header_menu_list[index]["is_selected"] = true;
      header_menu_list[selected_menu_index]["is_selected"] = false;
    });
    selected_menu_index = index;
  }
}
