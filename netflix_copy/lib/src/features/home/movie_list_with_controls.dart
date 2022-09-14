import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class movie_list_with_controls extends StatelessWidget {
  const movie_list_with_controls({
    Key? key,
    required this.ellipsis_v,
    required this.section_title,
    required this.card_height,
    required this.card_width,
  }) : super(key: key);

  final IconData ellipsis_v;
  final String section_title;
  final double card_width;
  final double card_height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              section_title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: [
            SizedBox(
              height: card_height,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  return true;
                },
                child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5.0),
                                        topRight: Radius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        width: 100,
                                        child: Image.asset(
                                          "assets/images/top-gun-poster.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: card_width,
                                      height: card_height,
                                      child: Center(
                                        child: SizedBox(
                                          width: card_width - 10,
                                          height: card_width - 10,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              shadowColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                            ),
                                            onPressed: () {},
                                            child: Image.asset(
                                              "assets/images/play_button.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: card_width,
                                      height: 3,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: calculateProgress(
                                          100, "2.30", "1.00"),
                                      height: 3,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: card_width,
                              color: Color.fromRGBO(26, 25, 26, 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(
                                      Icons.info_outline_rounded,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    ellipsis_v,
                                    size: 14.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  double calculateProgress(
      double total_width, String total_duration, String total_view_time) {
    double total_secs = double.parse(total_duration);
    double total_view_time_secs = double.parse(total_view_time);
    double parcentage = total_view_time_secs / total_secs;
    return total_width * parcentage;
  }
}
