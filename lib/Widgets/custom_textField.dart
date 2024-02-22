import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.hintText,this.onChanged});
String? hintText;
   Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: onChanged ,
      decoration: InputDecoration(
   hintText:hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          border:const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          )
      ),
    );
  }
}
