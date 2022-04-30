import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:latest_film_api/widgets/detail_page.dart';

import '../constants/constants.dart';

class ChildCardStyle extends StatelessWidget {
  final String title, subtitle, details, rating, imageurl, originalImg;
  const ChildCardStyle({
    required this.title,
    required this.originalImg,
    required this.subtitle,
    required this.details,
    required this.rating,
    required this.imageurl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.blueGrey[50],
      child: SizedBox(
        height: 130,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: defaultPadding,
              height: 120,
              width: 80,
              color: Colors.grey,
              //alignment: Alignment.center,
              child: Image.network(imageurl, fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    title,
                    style: titleStyle,
                  ),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      subtitle,
                      style: subtitleStyle,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width - 320),
                    Text(
                      rating,
                      style: subtitleStyle,
                    ),
                    SizedBox(width: 50)
                  ]),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailPage(imgUrl: originalImg, title: title,updated: subtitle,summary: details,)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 200),
                        Text('Details >>', style: minititleStyle)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
