import 'package:flutter_server_driven_ui/src/modules/home/models/fieldsModel.dart';
import 'package:flutter_server_driven_ui/src/modules/second/models/alignModel.dart';
import 'package:flutter_server_driven_ui/src/shared/models/widgetProperties.dart';
class SecondPageFieldModel {
  String type;
  String? label;
  FieldModel? data;
  int? priorityOnPage;
  List<String>? typeOfWidgetsInside;
  String position;
  int? numberOfWidgetsInside;
  AlignModel? align;
  List<SecondPageFieldModel>? widgetsConf;
  List<WidgetProperties>? properties;

  SecondPageFieldModel(this.type,this.position,{
    this.label,
    this.properties,
    this.data,
    this.priorityOnPage=0,this.typeOfWidgetsInside=const <String>[],
    this.numberOfWidgetsInside=0,this.align,this.widgetsConf
  });

  factory SecondPageFieldModel.fromMap(Map<String,dynamic> json){
    return SecondPageFieldModel(json["type"],json["position"],
    label: json["label"],
    properties: json["properties"]!=null && List.from(json["properties"]).isNotEmpty ?
    List.from(json["properties"]).map((e) => WidgetProperties.fromMap(e)).toList():[],
    data: FieldModel.fromJson(Map.from(json["data"])),
    align:AlignModel.fromMap(Map.from(json["align"])),
    numberOfWidgetsInside: json["numberOfWidgetsInside"],
    priorityOnPage: json["priorityOnPage"],
    typeOfWidgetsInside: json["typeOfWidgetsInside"],
    widgetsConf: json["widgetsConf"]!=null && List.from(json["widgetsConf"]).isNotEmpty ?
    List.from(json["widgetsConf"]).map((e) => SecondPageFieldModel(e["type"], e["position"])).toList():[]);
  }

  toJson(){
    return{
      "type":type,
      "label":label,
      "position":position,
      "align":align==null ?align:align!.toJson(),
      "numberOfWidgetsInside":numberOfWidgetsInside,
      "priorityOnPage":priorityOnPage,
      "typeOfWidgetsInside":typeOfWidgetsInside,
      "widgetsConf":widgetsConf
    };
  }


}