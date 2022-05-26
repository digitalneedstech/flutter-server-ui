import 'package:flutter/material.dart';
import 'package:flutter_server_driven_ui/src/modules/home/models/fieldsModel.dart';
import 'package:flutter_server_driven_ui/src/modules/home/models/formModel.dart';
import 'package:flutter_server_driven_ui/src/shared/assets/constants.dart';
import 'package:flutter_server_driven_ui/src/shared/widgets/server_driven_text_field/index.dart';
import 'package:flutter_server_driven_ui/src/shared/widgets/server_driven_text_widget/index.dart';

class FormWidget extends StatefulWidget {
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  FormModel? form;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, TextEditingController> controllers = {};
  void initState() {
    super.initState();
    updateFormFields();
  }

  Future<void> updateFormFields() async {
    /*
    TODO- Call and api and get response
    Dummy response is added in constants file
     */
    List<FieldModel> fieldsModel = FormModel.fromJson(jsonFormResponse).fields;
    FormModel formModel = FormModel(fieldsModel);
    setState(() {
      form = formModel;
      for (FieldModel model in formModel.fields) {
        if (model.type == "input") {
          TextEditingController controller =
              TextEditingController(text: model.value);
          controllers[model.name] = controller;
        }
      }
    });
  }

  List<Widget> getListOfWidgetsInForm() {
    List<Widget> widgets = form != null
        ? form!.fields
            .map((fieldModel) {
              if (fieldModel.type == "input") {
                TextEditingController? controller =
                    controllers[fieldModel.name];
                return TextFieldWidget(
                    controller ?? TextEditingController(text: ""), fieldModel,(String val){
                  //Write Save logic
                },validationErrorCallback: (String val){
                      //Write Validation Logic
                },);
              }
              else if(fieldModel.type=="submit") {
                return ElevatedButton(onPressed: (){
                  if(_formKey.currentState!=null && _formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                }, child: Center(child: TextWidget(label:fieldModel.name,style: const TextStyle(color: Colors.orange),),));
              }
              else {
                return TextWidget(label:fieldModel.name);
              }
            })
            .cast<Widget>()
            .toList()
        : [TextWidget()];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return form == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[...getListOfWidgetsInForm()]));
  }
}
