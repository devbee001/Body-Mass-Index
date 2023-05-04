import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPress;
  final Color? color;
  RoundedBtn({this.icon,required this.onPress,this.color});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon,size: 15,),
        constraints: BoxConstraints.tightFor(width: 56,height: 56),
        shape: CircleBorder(),
        elevation: 8,
        fillColor: color,
        onPressed: onPress
    );
  }
}
