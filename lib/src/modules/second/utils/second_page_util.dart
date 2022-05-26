import 'package:flutter/material.dart';
import 'package:flutter_server_driven_ui/src/modules/second/models/secondPageFieldModel.dart';
import 'package:flutter_server_driven_ui/src/modules/second/models/secondPageModel.dart';
import 'package:flutter_server_driven_ui/src/shared/widgets/server_driven_text_widget/index.dart';

List<Widget> getListOfWidgetsInForm(BuildContext context,SecondPageModel? secondPageModel) {
  List<Widget> widgets = secondPageModel != null
      ? secondPageModel.fields
      .map((fieldModel) {
    if (fieldModel.type == "container") {
      return Container(
          width: fieldModel.align!=null ?MediaQuery.of(context).size.width*fieldModel.align!.width:MediaQuery.of(context).size.width,
          height: fieldModel.align!=null ?MediaQuery.of(context).size.width*fieldModel.align!.height:MediaQuery.of(context).size.height,
          padding: fieldModel.align!=null ?EdgeInsets.all(fieldModel.align!.padding):EdgeInsets.all(0.0),
          child: getInternalWidgetForContainer(fieldModel)
      );
    }

  })
      .cast<Widget>()
      .toList()
      : [TextWidget()];
  return widgets;
}

Widget getInternalWidgetForContainer(SecondPageFieldModel fieldModel){
  if(fieldModel.type=="row"){
    return getWidgetForRow(fieldModel);
  }
  else if(fieldModel.type=="text") {
    return getWidgetForText(fieldModel);
  }
  return TextWidget(label:"Test Container");

}

Widget getWidgetForRow(SecondPageFieldModel fieldModel) {
  List<Widget>? getWidgets(SecondPageFieldModel fieldModel){
    return (fieldModel.widgetsConf != null &&
        fieldModel.widgetsConf!.isNotEmpty)
        ?
    fieldModel.widgetsConf?.map((e) {
      if (e.type == "text") {
        return getWidgetForText(e);
      }
      return Container();
    }).toList() : [TextWidget(label: "Dummy Widget")];
  }
  return Row(
      children:getWidgets(fieldModel)?? [TextWidget(label: "No Proper Configuration Found")]
  );
}

Widget getWidgetForText(SecondPageFieldModel fieldModel){
  return Text(fieldModel.label ?? "");
}