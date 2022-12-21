class Student {
  int id=0;
  String? firstName;
  String? lastName;
  int? age;

  Student({this.id=0, required this.firstName,required this.lastName,required this.age});

  Student.fromJson(Map<String, dynamic> jsonObject) {
    id = jsonObject["id"];
    firstName = jsonObject["firstName"];
    lastName = jsonObject["lastName"];
    age = jsonObject["age"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "age": age,
    };
  }
}
