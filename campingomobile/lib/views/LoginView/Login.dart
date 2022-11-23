import 'dart:convert';
import 'dart:ui';
import 'package:Campingo/constants/Theme.dart';
import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/data/LocalStorage.dart';
import 'package:Campingo/services/AuthService.dart';
import 'package:Campingo/views/FirstBoard/BottomNav.dart';
import 'package:Campingo/views/HomeView/HomeView.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart'as http;
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username= TextEditingController();
  TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
AuthService authservice=AuthService();
    Widget title = Text(
      '𝓵𝓸𝓰𝓲𝓷',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    // Widget loginButton = Positioned(
    //   left: MediaQuery.of(context).size.width / 4,
    //   bottom: 10,
    //   right: MediaQuery.of(context).size.width / 4,
    //   child: InkWell(
    //     splashColor: NowUIColors.trans,
    //     highlightColor: NowUIColors.trans,
    //     onTap: () {
    //       HapticFeedback.lightImpact();
    //       Fluttertoast.showToast(
    //         msg: 'Sign-In button pressed',
    //       );
    //     },
    //     child: Container(
    //       width: MediaQuery.of(context).size.width / 2,
    //       height: 50,
    //       child: Center(
    //           child: new Text("Login",
    //               style: const TextStyle(
    //                   color: const Color(0xfffefefe),
    //                   fontWeight: FontWeight.w600,
    //                   fontStyle: FontStyle.normal,
    //                   fontSize: 20.0))),
    //       decoration: BoxDecoration(
    //           gradient: mainButton,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Color.fromRGBO(0, 0, 0, 0.16),
    //               offset: Offset(0, 5),
    //               blurRadius: 10.0,
    //             )
    //           ],
    //           borderRadius: BorderRadius.circular(9.0)),
    //     ),
    //   ),
    // );

    Widget loginForm = Container(
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            decoration: BoxDecoration(
                color: NowUIColors.trans2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child:Form(
              // key: _formKey,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: username,
                        autofocus: false,

                        validator: (value) => value!.isEmpty ? "Please enter Username" : null,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person_pin),
                          hintText: 'Your Username?',
                          labelText: 'UserName ',
                        ),
                        // onSaved: (value) {
                        //   controller.username = value!.trim();
                        //   Logger().d("${controller.username}");
                        // },
                        // onChanged: (value) {
                        //   controller.username = value.trim();
                        //   Logger().d("${controller.username}");
                        // },
                        // onSaved: (String? value) {
                        //   // This optional block of code can be used to run
                        //   // code when the user saves the form.
                        // },

                      )
                  ),
                  //Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: password,
                      autofocus: false,
                      obscureText: true,
                      validator: (value) => value!.isEmpty ? "Please enter password" : null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'your Password',
                        labelText: 'Password',
                        
                      ),
                      // onSaved: (value) {
                      //   controller.password = value!.trim();
                      //   Logger().d("${controller.password}");
                      // },
                      // onChanged: (value) {
                      //   controller.password = value.trim();
                      //   Logger().d("${controller.password}");
                      // },
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top:8.0),
                  child: OutlinedButton.icon(
                    onPressed: (){
                      userLogin();
                    }, 
                    icon: Icon(Icons.login,size: 18,) ,
                     label: Text("login")),
                     )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    Widget socialRegister = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: 'Create new Account',
            style: TextStyle(
              color: NowUIColors.white,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(
                    context, '/register');
              },
          ),
        ),
      ],
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/imgs/cam.gif'),
                    fit: BoxFit.cover)
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: NowUIColors.trans,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                title,
                loginForm,
                Padding(padding: EdgeInsets.only(bottom: 5),
                    child: socialRegister),
               // loginButton,
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>BottomNav()));
                 },
            ),
          )
        ],
      ),
    );
  }

// //Fonction to call
// Future<void>login()async{
//   if(password.text.isNotEmpty && username.text.isNotEmpty){
//     var headers = {'Content-Type': 'application/json'};
//  var res = await http.post(Uri.parse('$BaseUrl$AuthUrlLogin'),
// body: jsonEncode({
//   'username':username.text,
//   'password':password.text}),
// headers: headers);
// if(res.statusCode==200){
//       Logger().d(password.text);
//       Logger().d(username.text);
//       Logger().d("with succ");
//   Navigator.push(context,
//    MaterialPageRoute(builder:(context)=>BottomNav()));
// }else{
//    ScaffoldMessenger.of(context)
//     .showSnackBar(SnackBar(content: Text("invalide credentiels")));
// }
//   }else{
//     ScaffoldMessenger.of(context)
//     .showSnackBar(SnackBar(content: Text("black fild not allowed")));
//   }
// }

  Future<void> userLogin() async {
    LocalStorage storage = LocalStorage();
    var headers = {'Content-Type': 'application/json'};
    var body =
    jsonEncode({"username":username.text , "password": password.text});
    var response = await http.post(Uri.parse('$BaseUrl$AuthUrlLogin'),
        headers: headers, body: body);
    if (response.statusCode == 200) {
      final userjs=(response.body);
      final data = jsonDecode(response.body);
      var jwtToken = data['token'];
      var idu = data['id'];
      var username = data['username'];
      var firstname = data['firstname'];
      var lastname = data['lastname'];
      var imageUrl = data['imageUrl'];
      var email = data['email'];

      //var userData = data['user'];

     ScaffoldMessenger.of(context)
     .showSnackBar(SnackBar(content:  Text("welcome ${firstname}")));
       Logger().d(data);

       storage.savedata("username", username);
      storage.saveimageUrl("imageUrl", imageUrl);
      storage.savedata("firstname", firstname);
      storage.savedata("lastname", lastname);
      storage.saveemail("email", email);
      storage.saveid("id", idu);
      storage.saveToken("token", jwtToken);
      Logger().d(" Token From Login response: $jwtToken");
      // Logger().d(" Token From Login response: ${userData.runtimeType}");
      // user = User.fromJson(userData);
      Logger().d(" Username From Login response: ${username}");
       //AuthStore.to.saveToken(jwtToken);
      var a = await storage.readToken();
      Logger().d(" Token From app : $a");
      var dt = await storage.readusername();
      Logger().d(" Token From app : $dt");
      var idt = await storage.readid();
      Logger().d(" id From app : $idt");
       Navigator.push(context,
   MaterialPageRoute(builder:(context)=>BottomNav()));
     // return user;
    } else {
      Logger().d(response.reasonPhrase);
       ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar(content: Text("invalide credentiels")));
      // return false;
    }
    return null;
  }

}
class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}