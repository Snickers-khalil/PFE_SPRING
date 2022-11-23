import 'dart:convert';
import 'package:Campingo/Bindings/Bindings.dart';
import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/data/LocalStorage.dart';
import 'package:Campingo/models/UserModel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


class AuthService {
  var token;
  LocalStorage storage = LocalStorage();
  var user;
    Future<void> userLogin({username, password}) async {
    LocalStorage storage = LocalStorage();
    var headers = {'Content-Type': 'application/json'};
    var body =
    jsonEncode({"username":"$username" , "password": "$password"});
    var response = await http.post(Uri.parse('$BaseUrl$AuthUrlLogin'),
        headers: headers, body: body);
      Logger().d(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var jwtToken = data['token'];
      //var type = data['type'];
      var username = data['username'];
      var firstname = data['firstname'];
      //var userData = data['user'];
    //  ScaffoldMessenger.of(context)
    //  .showSnackBar(SnackBar(content:  Text("welcome ${firstname}")));
       Logger().d(data);
      storage.saveToken("token", jwtToken);
      Logger().d(" Token From Login response: $jwtToken");
      // Logger().d(" Token From Login response: ${userData.runtimeType}");
      // user = User.fromJson(userData);
      Logger().d(" Token From Login response: ${username}");
       //AuthStore.to.saveToken(jwtToken);
      var a = await storage.readToken();
      Logger().d(" Token From app : $a");
      //  Navigator.push(context,
  //  MaterialPageRoute(builder:(context)=>HomeView()));
     // return user;
    } else {
      Logger().d(response.reasonPhrase);

    //   ScaffoldMessenger.of(context)
    //  .showSnackBar(SnackBar(content: Text("invalide credentiels")));
      // return false;
    }
    return null;
  }
  
  
  // Future<bool> userSignUp({username, password, email}) async {
  //   var headers = {'Content-Type': 'application/json'};
  //   var body = jsonEncode({
  //     "username": "$username",
  //     "email": "$email",
  //     "password": "$password",
  //   });
  //   var response = await http.post(Uri.parse('$BaseUrl$AuthUrlRegister'),
  //       headers: headers, body: body);
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //
  //     Logger().d("userSignUp  json result : $data");
  //     // Logger().d("getUserApi  json result : ${data.runtimeType}");
  //     // Logger().d("getUserApi  json result : ${a.email}");
  //     return true;
  //   }
  //   return false;
  // }

  signOutUser() async {
    await LocalStorage().deleteToken();
    user = null;
    token = null;
    // Get.back();
    if (user == null && token == null){
      Get.offAllNamed(Routers.initialRoute);
    }
  }
  
  getLoggedUserId() async {
    var isUserLogged = await storage.readToken();
    if (isUserLogged != 0) {
      token = isUserLogged;
       Logger().d(token);
    } else {
     Logger().d("getLoggedUserId : error in user token");
    }
    return token;
  }
  getUsername() async {
    var isUserLogged = await storage.readusername();
    Logger().d("loged userrr",isUserLogged);
    if (isUserLogged != 0) {
      user = isUserLogged;
      Logger().d(user);
    } else {
      Logger().d("getLoggedUserId : error in user data");
    }
    return user;
  }
  getfirstname() async {
    var isUserLogged = await storage.readfirstname();
    Logger().d("loged userrr",isUserLogged);
    if (isUserLogged != 0) {
      user = isUserLogged;
      Logger().d(user);
    } else {
      Logger().d("getLoggedUserId : error in user data");
    }
    return user;
  }
  getlastname() async {
    var isUserLogged = await storage.readlastname();
    Logger().d("loged userrr",isUserLogged);
    if (isUserLogged != 0) {
      user = isUserLogged;
      Logger().d(user);
    } else {
      Logger().d("getLoggedUserId : error in user data");
    }
    return user;
  }
  getemail() async {
    var isUserLogged = await storage.reademail();
    Logger().d("loged userrr",isUserLogged);
    if (isUserLogged != 0) {
      user = isUserLogged;
      Logger().d(user);
    } else {
      Logger().d("getLoggedUserId : error in user data");
    }
    return user;
  }
  getimageUrl() async {
    var isUserLogged = await storage.readimageUrl();
    Logger().d("loged userrr",isUserLogged);
    if (isUserLogged != 0) {
      user = isUserLogged;
      Logger().d(user);
    } else {
      Logger().d("getLoggedUserId : error in user data");
    }
    return user;
  }

  Future<dynamic> getMe() async {
    var UserLogged = await storage.readToken();
    var userToken = await getLoggedUserId();
    Logger().d("token nnn: $userToken");
    var user= await getUsername;
    Logger().d("user : $user");
    var userid=user.hashCode;
    Logger().d("userid : $userid");
    Logger().d(userid.toString());
    //var userid =await userToken.
    var url = "$BaseUrl/utilisateur/$userid";
    // Logger().d(userToken.toString());
    // Logger().d(userToken.runtimeType);
    Map<String, String> headersAuth = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*",
      "Authorization": "Bearer $userToken",
    };
    var response = await http.get(
      Uri.parse("$url"),
      headers: headersAuth,
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
       Logger().d("getUserApi  json result : $data");
      // Logger().d("getUserApi  json result : ${data.runtimeType}");
      // Logger().d("getUserApi  json result : ${a.email}");
      return data;
    }
  }
}

