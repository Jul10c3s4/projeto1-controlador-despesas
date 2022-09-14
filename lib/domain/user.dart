
const String ContactTable = "contactTable";
const String idColumn = "idColumn";
const String nameColumn = "nameColumn";
const String imgColumn = "imgColumn";

class User{
  int? id;
  String? name;
  String? img;

  User.fromMap(Map<String, dynamic> map)
  : id = map[idColumn],
  name = map[nameColumn],
  img = map[imgColumn];

  Map<dynamic, dynamic> toMap(){

    Map<dynamic, dynamic> map = {

      nameColumn: name,
      imgColumn: name
    };

    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }



}