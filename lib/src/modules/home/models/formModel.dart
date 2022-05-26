import 'package:flutter_server_driven_ui/src/modules/home/models/fieldsModel.dart';

class FormModel{
  List<FieldModel> fields;
  FormModel(this.fields);
  factory FormModel.fromJson(Map<String,dynamic> form){
    return FormModel( List.from(form['data'])
        .map((e) =>
        FieldModel.fromJson(Map.from(e)))
        .toList(),);
  }

  toJson(){
    return{
      "data":fields
    };
  }
}