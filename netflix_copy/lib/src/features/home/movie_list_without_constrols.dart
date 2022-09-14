import 'package:flutter/material.dart';

class movie_list_without_constrols extends StatelessWidget {
  const movie_list_without_constrols({
    Key? key,
    required this.section_title,
    required this.card_height,
    required this.card_width,
  }) : super(key: key);

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
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    child: SizedBox(
                      width: card_width,
                      child: Image.asset(
                        "assets/images/top-gun-poster.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
