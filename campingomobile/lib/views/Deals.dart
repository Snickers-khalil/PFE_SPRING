// // import 'package:flutter/material.dart';

// // class Deals extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(child: Text("Deals Clicked")),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // class Randonner extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(child: Text("Randonner Clicked")),
// //     );
// //   }
// // }
// import 'dart:convert';
// import 'dart:ui';
// import 'package:Campingo/constants/Theme.dart';
// import 'package:Campingo/constants/card-horizontal.dart';
// import 'package:Campingo/constants/constants.dart';
// import 'package:Campingo/models/Randonner.dart';
// import 'package:Campingo/models/RandonnerModel.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

//   TextEditingController adressController = TextEditingController();
//   TextEditingController programmeController = TextEditingController();
//   TextEditingController cercuitController = TextEditingController();
//   TextEditingController diffcuiltController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController imageUrlController = TextEditingController();

//   late RandonnerModel randonner;
//   TextEditingController _textFieldController = TextEditingController();
//   Future<void> _displayTextInputDialog(BuildContext context) async {
//      final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//     // String? firstname,lastname,username,email,phone,city;
//     //TextEditingController password = TextEditingController();
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//            content: Form(
//             key: _formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.location_on),
//                         hintText: 'Adress d''Randonner?',
//                         labelText: 'adress ',
//                       ),controller: adressController,
//                       validator: (String? value){
//                       if(value!.isEmpty)
//                       {
//                         return 'Please Enter adress';
//                       }
//                       return null;
//                     },
//                     onSaved: (String? value){
//                      // titre = value!;
//                     },
//                     )
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.menu),
//                         hintText: 'programme',
//                         labelText: 'programme ',
//                       ),controller: programmeController,
//                       validator: (String? value){
//                       if(value!.isEmpty)
//                       {
//                         return 'Please Enter Description';
//                       }
//                       return null;
//                     },
//                     onSaved: (String? value){
//                      // description = value! ;
//                     },
//                     )
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.golf_course),
//                         hintText: 'cercuit',
//                         labelText: 'cercuit ',
//                       ),controller: cercuitController,
//                       validator: (String? value){
//                       if(value!.isEmpty)
//                       {
//                         return 'cercuit';
//                       }
//                       return null;
//                     },
//                     onSaved: (String? value){
//                      // cathegorie = value! ;
//                     },
//                     )
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       icon: Icon(Icons.dangerous),
//                       hintText: 'difficult',
//                       labelText: 'difficult ',
//                     ),controller: diffcuiltController,
//                     validator: (String? value){
//                       if(value!.isEmpty)
//                       {
//                         return 'Please Enter difficult';
//                       }
//                       return null;
//                     },
//                     onSaved: (String? value){
//                      // username = value!;
//                     },
//                   )
//                 ),
//                  Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: TextFormField(
//                    // controller: password,
//                     keyboardType: TextInputType.visiblePassword,
//                     decoration: const InputDecoration(
//                       icon: Icon(Icons.calendar_today),
//                       hintText: 'Date ',
//                       labelText: 'Date ',
//                     ),controller: dateController,
//                      validator: (String? value){
//                       if(value!.isEmpty)
//                       {
//                         return 'Please Enter Date d''ajout';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: TextFormField(
//                     // controller: password,
//                     keyboardType: TextInputType.visiblePassword,
//                     decoration: const InputDecoration(
//                       icon: Icon(Icons.calendar_today),
//                       hintText: 'image ',
//                       labelText: 'image ',
//                     ),controller: imageUrlController,
//                     validator: (String? value){
//                       if(value!.isEmpty)
//                       {
//                         return 'Please Enter Date d''ajout';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           );
//         });
//   }
  