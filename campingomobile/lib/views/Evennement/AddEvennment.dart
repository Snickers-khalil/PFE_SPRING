// import 'dart:io';
// import 'package:Campingo/models/RandonnerModel.dart';
// import 'package:Campingo/models/UserModel.dart';
// import 'package:Campingo/services/RandonnerService.dart';
// import 'package:http/http.dart'as http;
// import 'package:Campingo/constants/Theme.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:get/get.dart';
//
//
//
// class AddEvennment extends StatefulWidget {
//   @override
//   _AddEvent createState() => _AddEvent();
// }
// User? user = User();
// class _AddEvent extends State<AddEvennment> {
//   get controller => null;
//
//   late Future<File> file;
//   String status = '';
//   late String base64Image;
//  late File tmpFile;
//   String errMessage = 'Error Uploading Image';
//
//   TextEditingController adressController = TextEditingController();
//   TextEditingController programmeController = TextEditingController();
//   TextEditingController cercuitController = TextEditingController();
//   TextEditingController diffcuiltController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController imageUrlController = TextEditingController();
//   late RandonnerModel randonner;
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     Widget title = Text(
//       'ADD Evennment',
//       style: TextStyle(
//           color: Colors.white,
//           fontSize: 34.0,
//           fontWeight: FontWeight.bold,
//           shadows: [
//             BoxShadow(
//               color: Color.fromRGBO(0, 0, 0, 0.15),
//               offset: Offset(0, 5),
//               blurRadius: 10.0,
//             )
//           ]),
//     );
//     Widget registerForm = Container(
//       height: 550,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             height: 550,
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.only(left: 32.0, right: 32.0),
//             decoration: BoxDecoration(
//                 color: NowUIColors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                     bottomLeft: Radius.circular(30))),
//             child:Form(
//               key: _formkey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                 Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: TextFormField(
//                                     decoration: const InputDecoration(
//                                       icon: Icon(Icons.location_on),
//                                       hintText: 'Adress d''Randonner?',
//                                       labelText: 'title',
//                                     ),controller: adressController,
//                                     validator: (String? value){
//                                     if(value!.isEmpty)
//                                     {
//                                       return 'Please Enter title';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (String? value){
//                                    // titre = value!;
//                                   },
//                                   )
//                               ),
//                               Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: TextFormField(
//                                     decoration: const InputDecoration(
//                                       icon: Icon(Icons.menu),
//                                       hintText: 'Description',
//                                       labelText: 'Description ',
//                                     ),controller: programmeController,
//                                     validator: (String? value){
//                                     if(value!.isEmpty)
//                                     {
//                                       return 'Please Enter Description';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (String? value){
//                                    // description = value! ;
//                                   },
//                                   )
//                               ),
//                               Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: TextFormField(
//                                     decoration: const InputDecoration(
//                                       icon: Icon(Icons.golf_course),
//                                       hintText: 'Debut_event',
//                                       labelText: 'Debut_event ',
//                                     ),controller: cercuitController,
//                                     validator: (String? value){
//                                     if(value!.isEmpty)
//                                     {
//                                       return 'Debut_event';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (String? value){
//                                    // cathegorie = value! ;
//                                   },
//                                   )
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 8.0),
//                                 child: TextFormField(
//                                   decoration: const InputDecoration(
//                                     icon: Icon(Icons.dangerous),
//                                     hintText: 'Fin_Event',
//                                     labelText: 'Fin_Event ',
//                                   ),controller: diffcuiltController,
//                                   validator: (String? value){
//                                     if(value!.isEmpty)
//                                     {
//                                       return 'Please Enter Fin_Event';
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (String? value){
//                                    // username = value!;
//                                   },
//                                 )
//                               ),
//
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius:
//                         BorderRadius.all(const Radius.circular(10.0)),
//                         color: Colors.white,
//                       ),
//                       height: 100,
//                       width: 120,
//                       child: TextButton.icon(
//                         onPressed: () async {
//                           Get.bottomSheet(imagePicker(context),
//                           );
//                          //  await controller.pickImage(ImageS);
//                         },
//                         icon: Icon(
//                           Icons.add_a_photo,
//                           color: Colors.blue.shade300,
//                         ),
//                         label: Text(
//                           "Ajout Image",
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   RaisedButton(
//                       color: Colors.green,
//                       textColor: Colors.white,
//                       child: Text('Enregistrer'),
//                       onPressed: () async {
//                         // String title = titleController.text;
//                         // String description = descriptionController.text;
//                         // String date_ajout = date_ajoutController.text;
//                         // String fin_ajout = fin_ajoutController.text;
//                         // String imageUrl = imageUrlController.text;
//                         // EvenmentModel evenments =
//                         // await addrandonner (adress, proramme,cercuit,diffcuilt,date,imageUrl);
//                         // Logger().d(randenners);
//                         // adressController.text = '';
//                         // programmeController.text = '';
//                         // cercuitController.text = '';
//                         // diffcuiltController.text = '';
//                         // dateController.text = '';
//                         // setState(() {
//                         //   randonner = randenners;
//                         // });
//                       }),
//                   FlatButton(
//                     color: Colors.red,
//                     textColor: Colors.white,
//                     child: Text('Annuler'),
//                     onPressed: () {
//                       setState(() {
//                         Navigator.pop(context);
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//
//           ),
//         ],
//       ),
//     );
//
//
//
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage('assets/imgs/register-bg.png'),
//                     fit: BoxFit.cover)
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: NowUIColors.trans,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20.0,right: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Spacer(flex:1),
//                 Center(
//                   child: title,
//                 ),
//                 Spacer(),
//                 registerForm,
//                 Spacer(),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 30,
//             left: 5,
//             child: IconButton(
//               color: Colors.white,
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
//   // chooseImage() {
//   //   setState(() {
//   //     file = ImagePicker.pickImage(source: ImageSource.gallery) as Future<File>;
//   //   });
//   // }
//
//
// Widget imagePicker(context) {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
//     ),
//     child: Wrap(
//       alignment: WrapAlignment.end,
//       crossAxisAlignment: WrapCrossAlignment.end,
//       children: [
//         ListTile(
//           leading: Icon(Icons.camera),
//           title: Text('كاميرا', ),
//           onTap: () async {
//             Get.back();
//             await controller
//                 .chosenImagesSingleImagePicker2(ImageSource.camera);
//             // await controller.tester();
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.image),
//           title: Text(
//             'معرض الصور',
//
//           ),
//           onTap: () async {
//             // controller.files2.clear();
//             Get.back();
//             await controller.chosenImagesMultiFilePicker(context);
//             // await controller.chosenImagesSingleImagePicker(ImageSource.gallery);
//           },
//         ),
//       ],
//     ),
//   );
// }
// }
//
