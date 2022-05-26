
import 'package:flutter_server_driven_ui/src/modules/second/models/secondPageFieldModel.dart';

class SecondPageModel{
  List<SecondPageFieldModel> fields;
  SecondPageModel(this.fields);
  factory SecondPageModel.fromJson(Map<String,dynamic> form){
    return SecondPageModel( List.from(form['data'])
        .map((e) =>
        SecondPageFieldModel.fromMap(Map.from(e)))
        .toList(),);
  }

  toJson(){
    return{
      "data":fields
    };
  }
}