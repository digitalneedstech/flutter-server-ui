import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_server_driven_ui/src/modules/second/models/secondPageFieldModel.dart';
import 'package:flutter_server_driven_ui/src/modules/second/models/secondPageModel.dart';
import 'package:flutter_server_driven_ui/src/modules/second/utils/second_page_util.dart';
import 'package:flutter_server_driven_ui/src/shared/assets/constants.dart';

class SecondPageBody extends StatefulWidget{
  SecondPageBodyState createState()=>SecondPageBodyState();
}
class SecondPageBodyState extends State<SecondPageBody>{
  SecondPageModel? secondPageModel;

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
    List<SecondPageFieldModel> fieldsModel = SecondPageModel.fromJson(jsonSecondPageResponse).fields;
    SecondPageModel formModel = SecondPageModel(fieldsModel);
    setState(() {
      secondPageModel = formModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return secondPageModel==null ?const Center(child: CircularProgressIndicator(),):ListView(
      children: getListOfWidgetsInForm(context, secondPageModel)
    );
  }
}