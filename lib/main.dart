import 'package:flutter/cupertino.dart'; //ios
import 'package:flutter/material.dart'; //android
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/screens/studentAdd.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var mesaj = "helloooo";

  Student selectedStudent = Student.withid(0, "", "", 0);

  List<Student> students = [
    Student.withid(1, "samet", "burhan", 45),
    Student.withid(2, "engin", "demiroğ", 65),
    Student.withid(3, "ali", "hasan", 12)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildbody(context),
    );
  }

  String sinavHesapla(int not) {
    var sonuc = "";
    if (not >= 50) {
      sonuc = "geçti";
    } else if (not >= 40 && not <= 50) {
      sonuc = "büt";
    } else {
      sonuc = "kaldı";
    }
    return sonuc;
  }

  void mesajGoster(BuildContext context, int not) {
    var alert = AlertDialog(
      title: Text("sınav sonucu"),
      content: Text(sinavHesapla(not)),
    );
    showDialog(context: context, builder: (BuildContext content) => alert);
  }

  buildbody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              //eleman sayısı kadar aşağıdaki kod bloğunu çalıştırır
              itemCount: students.length,
              itemBuilder: (BuildContext, int index) {
                //return Text(students[index].firstname);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/3375230/pexels-photo-3375230.jpeg"),
                  ),
                  title: Text(students[index].firstname +
                      " " +
                      students[index].lastname),
                  subtitle: Text("sınavdan aldığı not " +
                      students[index].grade.toString() +
                      " [" +
                      students[index].getstatus +
                      "]"),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      print(students[index].grade);
                      selectedStudent = students[index];
                    });
                  },
                );
              }),
        ),
        Text("Seçili öğrenci : " + selectedStudent.firstname),
        Center(
          child: ElevatedButton(
            onPressed: () {
              /*setState(() {
                students.remove(selectedStudent);
              });
              mesajGoster(context, 10);*/
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentAdd()));
            },
            child: Text("sonucu gör"),
          ), //Text("merkez"),
        ),
      ],
    );
  }

  buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40 && grade <= 50) {
      return Icon(Icons.access_alarm);
    } else {
      return Icon(Icons.clear);
    }
  }
}
