import 'package:flutter/material.dart';
import 'package:flutter_server_driven_ui/src/modules/home/models/fieldsModel.dart';
import 'package:flutter_server_driven_ui/src/modules/home/models/formModel.dart';
import 'package:flutter_server_driven_ui/src/modules/home/wodgets/form/index.dart';
import 'package:flutter_server_driven_ui/src/modules/second/index.dart';

class HomePage extends StatefulWidget{
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server Driven UI"),
      ),
      body: ListView(children:[ FormWidget(),Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPage()));
        },child: const Center(child: Text("Navigate to Next Page"),)),
      )]),
    );
  }
}