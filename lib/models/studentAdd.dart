import 'package:flutter/material.dart';
import 'package:flutter_application_1/validation/studentVal.dart';

class StudentAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _StudentAddState();
  }
}


class _StudentAddState exends State with ValidationMixinForStudet{
  var student = Student.withoutInfo();
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20), //only/top,left,right,bottom
          child: Form(child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Adı", hintText: "Samet"),
                validator: valFirstName,
                onSaved: (String value){
                  student.firstName = value;
                },
              )
            ],
          )),
        ),
      );
  }
}