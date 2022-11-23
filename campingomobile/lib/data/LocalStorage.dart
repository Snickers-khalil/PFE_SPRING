import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  GetStorage box = GetStorage();

  void saveToken(jwtToken, value) async {
    print("saveToken called");
    await box.write(jwtToken,value);
    //await pref.re(jwtToken,value);
  }

  void savedata(username, value) async {
    print("save username called");
    await box.write(username,value);
    //await pref.re(jwtToken,value);
  }
  void savefirstname(firstname, value) async {
    print("save firstname called");
    //var user=JsonDecoder(utilisateur);
    await box.write(firstname,value);
    //await pref.re(jwtToken,value);
  }
  void saveemail(email, value) async {
    print("save email called");
    //var user=JsonDecoder(utilisateur);
    await box.write(email,value);
    //await pref.re(jwtToken,value);
  }
  void savelastname(lastname, value) async {
    print("save lastname called");
    //var user=JsonDecoder(utilisateur);
    await box.write(lastname,value);
    //await pref.re(jwtToken,value);
  }
  void saveimageUrl(imageUrl, value) async {
    print("save imageUrl called");
    //var user=JsonDecoder(utilisateur);
    await box.write(imageUrl,value);
    //await pref.re(jwtToken,value);
  }
  void saveid(id, value) async {
    print("save id called");
    //var user=JsonDecoder(utilisateur);
    await box.write(id,value);
    //await pref.re(jwtToken,value);
  }
  readid() async {
    print("read id called");
    var id = await box.read("id");
    print('$id');
    if (id == null) {
      id = null;
    }
    return id;
  }
  readusername() async {
    print("read username called");
    var username = await box.read("username");
    print('$username');
    if (username == null) {
      username = null;
    }
    return username;
  }
  reademail() async {
    print("read email called");
    var email = await box.read("email");
    print('$reademail');
    if (email == null) {
      email = null;
    }
    return email;
  }
  readfirstname() async {
    print("read firstname called");
    var firstname = await box.read("firstname");
    print('$firstname');
    if (firstname == null) {
      firstname = null;
    }
    return firstname;
  }
  readlastname() async {
    print("read lastname called");
    var lastname = await box.read("lastname");
    print('$lastname');
    if (lastname == null) {
      lastname = null;
    }
    return lastname;
  }
  readimageUrl() async {
    print("read username called");
    var imageUrl = await box.read("imageUrl");
    print('$imageUrl');
    if (imageUrl == null) {
      imageUrl = null;
    }
    return imageUrl;
  }

  readToken() async {
    print("readToken called");
    var token = await box.read("token");
    if (token == null) {
      token = null;
    }
    return token;
  }

  Future deleteToken() async {
    print("deleteToken called");
    box.remove('token');
  }


}
