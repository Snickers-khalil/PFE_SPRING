import 'dart:convert';
import 'package:Campingo/views/LoginView/Login.dart';
import 'package:http/http.dart'as http;
import 'package:Campingo/constants/Theme.dart';
import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/data/LocalStorage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {

  String? firstname,lastname,username,email,phone,city;

  //TextController to read text entered in text field
  // TextEditingController firstname = TextEditingController();
  // TextEditingController lastname = TextEditingController();
  // TextEditingController username = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController phone = TextEditingController();
  // TextEditingController city = TextEditingController();
  //  String? firstname,lastname,username,email,phone,city;
  TextEditingController password = TextEditingController();
  

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Widget title = Text(
      'ℛ𝒆𝓰𝓲𝓼𝓽𝒆𝓻',
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
    
    Widget registerForm = Container(
      height: 550,
      child: Stack(
        children: <Widget>[
          Container(
            height: 550,
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
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Your Firstname?',
                        labelText: 'FirstName ',
                      ),
                      validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Firstname';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      firstname = value!;
                    },
                      
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Your LastName?',
                        labelText: 'LastName ',
                      ),
                      validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter your Lastame';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      lastname = value! ;
                    },
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person_pin),
                      hintText: 'Your Username?',
                      labelText: 'UserName ',
                    ),
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Username';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      username = value!;
                    },
                  )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail_outline),
                        hintText: 'Your Email?',
                        labelText: 'Email',
                      ),
                      validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter Email';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      email = value! ;
                    },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'your Password',
                      labelText: 'Password',
                    ),
                     validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      //controller: phone,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'What is Your Phone Number?',
                        labelText: 'Phone',
                      ),
                      onSaved: (String? value) {
                         phone = value! ;
                      },
                       validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Your Phone Number';
                      }
                      return null;
                    },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                  //  controller: city,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: 'Where did you live ?',
                      labelText: 'City',
                    ),
                    onSaved: (String? value) {
                      city = value! ;
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top:5.0),
                  child: OutlinedButton.icon(
                    onPressed: ()  {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    Registeruser(_formkey);
                  }
                },
                    icon: Icon(Icons.backup_outlined,
                                size: 18,) ,
                     label: Text("Register")),
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
            text: 'I have an Account',
            style: TextStyle(
              color: NowUIColors.white,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(
                    context, '/login');
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
                image: DecorationImage(image: AssetImage('assets/imgs/pic5.jpg'),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Spacer(flex:1),
                Center(
                  child: title,
                ),
                Spacer(),
                registerForm,
                Spacer(),
                Padding(padding: EdgeInsets.only(bottom: 25), child: socialRegister)
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
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          )
        ],
      ),
    );
  }
  LocalStorage storage = LocalStorage();
  Registeruser(GlobalKey<FormState> formkey) async {
    //var url = '$BaseUrl$AuthUrlRegister';
    var body = jsonEncode({
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "email": email,
      "password": password.text,
      "phone": phone,
      "city": city,
    });
    var headers = {'Content-Type': 'application/json'};
    var response =
        await http.post(Uri.parse('$BaseUrl$AuthUrlRegister'),
         headers: headers,
          body: body);
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var jwtToken = data['token'];
      storage.saveToken("token", jwtToken);
      Logger().d(data['token']);
      Logger().d(username);
      Logger().d(" Register with succ");
       ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar(content: Text("Register avec succe")));
  Navigator.push(context,
   MaterialPageRoute(builder:(context)=>Login()));
    ScaffoldMessenger.of(context)
     .showSnackBar(SnackBar(content:  Text("welcome ${username}")));
    }else{
       ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar(content: Text("invalide credentiels")));
    }
    // Logger().d(data);
  }
}
