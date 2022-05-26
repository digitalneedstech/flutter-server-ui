import 'package:flutter/material.dart';
import 'package:flutter_server_driven_ui/src/modules/home/models/fieldsModel.dart';

class TextFieldWidget extends StatelessWidget{
  TextEditingController controller;
  FieldModel fieldsModel;
  Function? validationErrorCallback;
  Function saveCallBack;
  TextFieldWidget(this.controller,this.fieldsModel,this.saveCallBack,{this.validationErrorCallback});
  @override
  Widget build(BuildContext context) {
    if(fieldsModel.optional && validationErrorCallback==null) {
      return TextFormField(
        controller: controller,
      );
    }
    return TextFormField(
      controller: controller,
      validator: (String? val){
        return val==null ? validationErrorCallback!(val):null;
      },
      onSaved: (String? val){
        saveCallBack(val);
      },
    );
  }
}