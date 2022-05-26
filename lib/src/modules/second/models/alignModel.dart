
import 'package:flutter/cupertino.dart';

class AlignModel{
  int? top,bottom,left,right;
  String? alignUnit;
  double width,height;
  double padding;

  AlignModel({this.padding=0.0,this.width=.80,this.height=0.20,this.top,this.bottom,this.left,this.alignUnit,this.right});
  factory AlignModel.fromMap(Map<String,dynamic>? json){
    if(json==null){
      return AlignModel(alignUnit: "px",left: 0,right: 0,bottom: 0,top: 0,height: 0.20,width: 0.80);
    }
    return AlignModel(top: json["top"],bottom: json["bottom"],right: json["right"],left: json["left"],
    alignUnit: json["alignUnit"]);

  }
  toJson(){
    return{
      "top":top ?? 0,
      "bottom":bottom ??0,
      "left":left ??0,
      "right":right ??0,
      "alignUnit":"px"?? 0
    };
  }
}