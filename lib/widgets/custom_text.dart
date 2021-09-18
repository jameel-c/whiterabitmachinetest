import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
final TextAlign textAlign ;

  CustomText({this.text = "null", this.size= 10.0, this.color = Colors.white, this.weight = FontWeight.bold,this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.fade,
      style: (TextStyle(color: color  ,fontSize: size , fontWeight: weight ,)),
    );
  }
}
