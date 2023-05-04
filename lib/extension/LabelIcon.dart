import 'package:flutter/material.dart';


class LabelIcon extends StatelessWidget {
  final IconData? icon;
  final String? text;

  LabelIcon({this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Icon(icon,
          size: 80,),),
        Text("$text")
      ],);
  }
}