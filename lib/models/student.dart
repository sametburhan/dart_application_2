class Student {
  String firstname;
  String lastname;
  int grade;
  String _status;
  int id;

  Student(String firstname, String lastname, int grade) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.grade = grade;
  }
  Student.withid(int id, String firstname, String lastname, int grade) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.grade = grade;
    this.id = id;
  }

  Student.withoutInfo() {}

  String get getfirstname {
    return "Ogr " + this.firstname;
  }

  void set setfirstname(String value) {
    this.firstname = value;
  }

  String get getstatus {
    var message = "";
    if (this.grade >= 50) {
      message = "geçti";
    } else if (this.grade >= 40 && this.grade <= 50) {
      message = "büt";
    } else {
      message = "kaldı";
    }
    return message;
  }
}
