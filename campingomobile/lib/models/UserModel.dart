
class User {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? city;
  String? phone;
  String? imageUrl;
  Role? roles;

  User({this.id, this.username, this.firstname, this.lastname, this.email,
        this.password, this.city,this.phone, this.imageUrl, this.roles,
  });
  


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    // role: json["role"] == null ? null : json["role"],
     roles: json["roles"] == null ? null : Role.fromJson(json["roles"]),
  );


  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    // "role": role == null ? null : role,
    // "role": role == null ? null : role!.toJson(),

  };

  int? getId()=> id;
set Id(id)=>id=id;

String? getUsername() {
  return username;
}
setUsername(String username){
  username=username;
}
String? getPassword() {
  return password;
}
setPassword(String password){
  password=password;
}


}

class Role {
  Role({
    required this.id,
    required this.name,
  });
  int id;
  String name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id == null ? null : id,
  //   "name": name == null ? null : name,
  // };
}


// int? getId()=> id;
// set Id(id)=>id=id;

// String? getUsername() {
//   return username;
// }
// setUsername(String username){
//   username=username;
// }
// String? getPassword() {
//   return password;
// }
// setPassword(String password){
//   password=password;
// }