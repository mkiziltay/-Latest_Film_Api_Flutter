import 'package:flutter/material.dart';
import 'package:latest_film_api/constants/constants.dart';

class DetailPage extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String summary;
  final String updated;
  const DetailPage({Key? key, required this.imgUrl, required this.title, required this.summary, required this.updated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Stack(children: [
        Container(
          height: size.height,
          width: size.width,
          child: Image.network(imgUrl, fit: BoxFit.fill),
        ),
        Positioned(
          top: size.height/2,
          child: Container(height: size.height*0.4,width: size.width,
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.white),
          child: Padding( padding: defaultPadding*4,
            child: Column(children: [
              _buildInformationRow('Name     :  ', title),
              _buildInformationRow('Updated :  ',  updated),
              Container( height: 185,
              child: SingleChildScrollView(scrollDirection: Axis.vertical,
              child: Text(summary,
              style: TextStyle(fontSize: 15, color: const Color.fromARGB(255, 28, 119, 155)),))
              )
            ]),
          ),),
        )
      ]),
    );
  }
}

_buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label, style: subtitleStyle),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: subtitleStyle,
          )
        else if (value == null)
          Text(
            'Not available',
            style: subtitleStyle,
          )
        else
          Text(
            value,
            style: subtitleStyle,
          ),
      ],
    );
  }
