
import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({ this.ontap, required this.text}) ;
String text;
VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),

        width: double.infinity,
        height: 50,
        child:Center(child: Text(text)),
      ),
    );
  }
}
