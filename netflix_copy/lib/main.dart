import 'package:flutter/material.dart';
import 'package:netflix_clone/src/features/downloads/downloads_screen.dart';
import 'package:netflix_clone/src/features/fat_laughs/fast_laughs_screen.dart';
import 'package:netflix_clone/src/features/home/home_screen.dart';
import 'package:netflix_clone/src/features/new_and_hot/new_and_hot_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationWidget(),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<BottomNavigationWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onNavigationItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget displayPageForSelectedTab(int index) {
    switch (index) {
      case 0:
        return Home_Screen();
      case 1:
        return NewAndHot_Screen();
      case 2:
        //   return FastLaughs_Screen();
        // case 3:
        return Downloads_Screen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: displayPageForSelectedTab(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: "New & Hot",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.tag_faces),
          //   label: "Fast Laughs",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: "Downloads",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onNavigationItemTapped,
      ),
    );
  }
}
