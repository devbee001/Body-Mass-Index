import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color? color ;
  final Widget? myChild;
  final void Function()? onPressed;
  ReusableCard({this.color,this.myChild,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(child: myChild,decoration:BoxDecoration(
          color: color,
            borderRadius: BorderRadius.circular(10)
        ),),
      ),
    );
  }
}

