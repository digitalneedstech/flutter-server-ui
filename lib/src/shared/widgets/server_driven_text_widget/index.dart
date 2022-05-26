import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget{
  String? label;
  TextStyle? style;
  TextWidget({this.label="test",this.style});
  @override
  Widget build(BuildContext context) {
    if(style==null) {
      return Text(label!);
    }
    return Text(label!,style: style,);
  }
}