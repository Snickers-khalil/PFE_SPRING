// //
// // import 'dart:convert';
// // import 'dart:typed_data';
// //
// // import 'package:Campingo/models/UserModel.dart';
// // import 'package:Campingo/services/AuthService.dart';
// // import 'package:Campingo/services/AuthService.dart';
// // import 'package:flutter/material.dart';
// // import 'package:logger/logger.dart';
// // // import 'package:travel_budget/widgets/provider_widget.dart';
// // import 'package:provider/provider.dart';
// //
// // class Profil extends StatelessWidget{
// //   late User user;
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     AuthService fetchApi=AuthService();
// //     return SingleChildScrollView(
// //       child: Column(
// //       children: <Widget>[
// //         Padding(
// //           padding: const EdgeInsets.only(top: 100),
// //           child: FutureBuilder(
// //             future: fetchApi.getUsername(),
// //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// //               if (snapshot.data == null) {
// //                 Logger().d(snapshot.data);
// //                 Logger().d('erreur Fetching Data');
// //                 return Container(child: Center(child: CircularProgressIndicator(),));
// //               }
// //               return Text('${snapshot.data}');
// //             },
// //
// //     ),
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.only(top: 100),
// //           child: FutureBuilder(
// //             future: fetchApi.getfirstname(),
// //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// //               if (snapshot.data == null) {
// //                 Logger().d(snapshot.data);
// //                 Logger().d('erreur Fetching Data');
// //                 return Container(child: Center(child: CircularProgressIndicator(),));
// //               }
// //               return Text('${snapshot.data}');
// //             },
// //           ),
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.only(top: 100),
// //           child: FutureBuilder(
// //             future: fetchApi.getlastname(),
// //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// //               if (snapshot.data == null) {
// //                 Logger().d(snapshot.data);
// //                 Logger().d('erreur Fetching Data');
// //                 return Container(child: Center(child: CircularProgressIndicator(),));
// //               }
// //               return Text('${snapshot.data}');
// //             },
// //           ),
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.only(top: 100),
// //           child: FutureBuilder(
// //             future: fetchApi.getimageUrl(),
// //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// //               var blob = snapshot.data;
// //               Uint8List imageUri = Base64Codec().decode(blob);
// //               if (snapshot.data == null) {
// //                 Logger().d(snapshot.data);
// //                 Logger().d('erreur Fetching Data');
// //                 return Container(child: Center(child: CircularProgressIndicator(),));
// //               }
// //               // return Text('${snapshot.data}');
// //               return Image.memory(imageUri,fit:BoxFit.fill,width: 90,height: 90,);
// //             },
// //           ),
// //         ),
// //       ],
// //       ),
// //     );
// //   }
// //
// // }
// //
// //
// //
// // // import 'package:Campingo/controllers/ProfilController.dart';
// // // import 'package:Campingo/data/LocalStorage.dart';
// // // import 'package:Campingo/models/UserModel.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get_state_manager/src/simple/get_view.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:logger/logger.dart';
// // //
// // // class Profil extends  GetView<ProfilController>{
// // //   @override
// // //   Widget build(BuildContext context){
// // //     return MaterialApp(
// // //       title: 'Welcome',
// // //       home: Scaffold(
// // //         // appBar: AppBar(
// // //         //   title: Text('Welcome To User'),
// // //         //   centerTitle: true,
// // //         //   backgroundColor: Colors.grey,
// // //         // ),
// // //         backgroundColor: Colors.white,
// // //         body: Container(
// // //             alignment: Alignment.center,
// // //             child: Stack(
// // //                 alignment: Alignment.topCenter,
// // //             children:[
// // //               _getCard(),
// // //               _getAvatar(),
// // //               _getTextOnAvatar(),
// // //              // _getImage(),
// // //             ]
// // //           )
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //  Container _getCard() {
// // //    return Container(
// // //       width: 350,
// // //       height: 500,
// // //       margin:EdgeInsets.all(40),
// // //       decoration:BoxDecoration(
// // //           borderRadius: BorderRadius.circular(20),color: Colors.grey),
// // //       child: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //          Text("khalil",
// // //          style:TextStyle(fontSize:30,color:Colors.white)),
// // //           Text("Etudiant a ISET BEJA",
// // //               style:TextStyle(
// // //                 fontSize:20,fontWeight:FontWeight.bold ,color:Colors.black54)),
// // //           Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Row(
// // //                mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   Icon(Icons.mail),
// // //               Text("khalilbarhoumi@hotmail.com",style:TextStyle(fontSize: 15)),
// // //              FloatingActionButton(onPressed: _getImage)
// // //               ],
// // //               ),
// // //             ],
// // //           )],
// // //       ),
// // //     );
// // //  }
// // //   Container  _getAvatar() {
// // //     return Container(
// // //         width: 150,
// // //         height: 120,
// // //       decoration:BoxDecoration(
// // //           borderRadius: BorderRadius.all(Radius.circular(60)),
// // //     //border:Border.all(color: Colors.white,width: 0),
// // //     image:DecorationImage(
// // //       image: AssetImage("assets/imgs/pic3.jpg"),
// // //    // image:DecorationImage(
// // //       //  image: AssetImage("assets/imgs/khalil.jpg"),fit: BoxFit.cover,
// // //      //image: AssetImage('assets/khalil.jpg'),fit: BoxFit.cover
// // //     ),
// // //     ),
// // //     );
// // //   }
// // //   Container _getTextOnAvatar(){
// // //     return Container(
// // //       width:40,
// // //       height: 40,
// // //         child:const Text ("K",
// // //         style:TextStyle(color:Colors.white,
// // //                       fontSize: 30,
// // //                     fontFamily: 'Arial',
// // //                  fontStyle: FontStyle.italic)
// // //     ),
// // //     );
// // //   }
// // //  /*Container _getCircleAvatar(){
// // //     return Container (
// // //       child: CircleAvatar(
// // // backgroundImage: AssetImage('assets/khalil.jpg'),radius: 50,
// // //       )
// // //     );
// // //  }*/
// // //   Future<Container> _getImage() async {
// // //     ImagePicker picker = ImagePicker();
// // //     XFile? image = await picker.pickImage(source: ImageSource.gallery);
// // //     return Container (
// // //         child: CircleAvatar(
// // //           backgroundImage: AssetImage('assets/khalil.jpg'),radius: 50,
// // //         )
// // //     );
// // //
// // //   }
// // // }
// // // // class Profil extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Center(child: Text("Profil Clicked")),
// // // //     );
// // // //   }
// // // // }
//
// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:Campingo/constants/Theme.dart';
// import 'package:Campingo/design/custom_drawer/home_drawer.dart';
// import 'package:Campingo/design/model/app_theme.dart';
// import 'package:Campingo/models/UserModel.dart';
// import 'package:Campingo/services/AuthService.dart';
// import 'package:Campingo/services/AuthService.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// // import 'package:travel_budget/widgets/provider_widget.dart';
// import 'package:provider/provider.dart';
//
// List<String> imgArray = [
//   "assets/imgs/album-1.jpg",
//   "assets/imgs/album-2.jpg",
//   "assets/imgs/album-3.jpg",
//   "assets/imgs/album-4.jpg",
//   "assets/imgs/album-5.jpg",
//   "assets/imgs/album-6.jpg"
// ];
//
// class Profil extends StatelessWidget {
//   @override
//   AuthService fetchApi = AuthService();
//
// // class Profil extends StatefulWidget {
// //   // const Profil({Key? key, this.screenIndex, this.iconAnimationController, this.callBackIndex}) : super(key: key);
// //   //
// //   // final AnimationController? iconAnimationController;
// //   // final DrawerIndex? screenIndex;
// //   // final Function(DrawerIndex)? callBackIndex;
// //
// //   @override
// //   _HomeDrawerState createState() => _HomeDrawerState();
// // }
// //
// // class _HomeDrawerState extends State<Profil> {
// //   List<DrawerList>? drawerList;
// //   AuthService fetchApi = AuthService();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// //
// //   // void setDrawerListArray() {
// //   //   drawerList = <DrawerList>[
// //   //     DrawerList(
// //   //       index: DrawerIndex.HOME,
// //   //       labelName: 'Home',
// //   //       icon: Icon(Icons.home),
// //   //     ),
// //   //     DrawerList(
// //   //       index: DrawerIndex.Help,
// //   //       labelName: 'Help',
// //   //       isAssetsImage: true,
// //   //       imageName: 'assets/images/supportIcon.png',
// //   //     ),
// //   //     DrawerList(
// //   //       index: DrawerIndex.FeedBack,
// //   //       labelName: 'FeedBack',
// //   //       icon: Icon(Icons.help),
// //   //     ),
// //   //     DrawerList(
// //   //       index: DrawerIndex.Invite,
// //   //       labelName: 'Invite Friend',
// //   //       icon: Icon(Icons.group),
// //   //     ),
// //   //     DrawerList(
// //   //       index: DrawerIndex.Share,
// //   //       labelName: 'Rate the app',
// //   //       icon: Icon(Icons.share),
// //   //     ),
// //   //     DrawerList(
// //   //       index: DrawerIndex.About,
// //   //       labelName: 'About Us',
// //   //       icon: Icon(Icons.info),
// //   //     ),
// //   //   ];
// //   // }
// //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.notWhite.withOpacity(0.5),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.only(top: 40.0),
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20, left: 150),
//                     child: FutureBuilder(
//                       future: fetchApi.getimageUrl(),
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         var blob = snapshot.data;
//                         Uint8List imageUri = Base64Codec().decode(blob);
//                         if (snapshot.data == null) {
//                           Logger().d(snapshot.data);
//                           Logger().d('erreur Fetching Data');
//                           return
//                             Container(child: Center(
//                               child: CircularProgressIndicator(),));
//                         }
//                         // return Text('${snapshot.data}');
//                         return
//                           Image.memory(imageUri, fit: BoxFit.fill,
//                             width: 100,
//                             height: 90,);
//                       },
//                     ),
//                   ),
//
//
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Divider(
//             height: 1,
//             color: AppTheme.grey.withOpacity(0.6),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 150),
//             child: FutureBuilder(
//               future: fetchApi.getemail(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   Logger().d(snapshot.data);
//                   Logger().d('erreur Fetching Data');
//                   return Container(
//                       child: Center(child: CircularProgressIndicator(),));
//                 }
//                 return Text('${snapshot.data}');
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 150),
//             child: FutureBuilder(
//               future: fetchApi.getlastname(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   Logger().d(snapshot.data);
//                   Logger().d('erreur Fetching Data');
//                   return Container(
//                       child: Center(child: CircularProgressIndicator(),));
//                 }
//                 return Text('${snapshot.data}');
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 150),
//             child: FutureBuilder(
//               future: fetchApi.getfirstname(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   Logger().d(snapshot.data);
//                   Logger().d('erreur Fetching Data');
//                   return Container(
//                       child: Center(child: CircularProgressIndicator(),));
//                 }
//                 return Text('${snapshot.data}');
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 150),
//             child: FutureBuilder(
//               future: fetchApi.getfirstname(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   Logger().d(snapshot.data);
//                   Logger().d('erreur Fetching Data');
//                   return Container(child: Center(
//                     child: CircularProgressIndicator(),));
//                 }
//                 return Text(
//                   '${snapshot.data}',
//                   style: TextStyle(
//                     fontFamily: AppTheme.fontName,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                     color: AppTheme.darkText,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 150),
//             child: FutureBuilder(
//               future: fetchApi.getlastname(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   Logger().d(snapshot.data);
//                   Logger().d('erreur Fetching Data');
//                   return Container(
//                       child: Center(child: CircularProgressIndicator(),));
//                 }
//                 return Text('${snapshot.data}');
//               },
//             ),
//           ),
//           Divider(
//             height: 1,
//             color: AppTheme.grey.withOpacity(0.6),
//           ),
//           Column(
//             children: <Widget>[
//               ListTile(
//                 title: Text(
//                   'Sign Out',
//                   style: TextStyle(
//                     fontFamily: AppTheme.fontName,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//
//                     color: AppTheme.darkText,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//                 trailing: Icon(
//                   Icons.power_settings_new,
//                   color: Colors.red,
//                 ),
//                 onTap: () {
//                   onTapped();
//                 },
//               ),
//               SizedBox(
//                 height: MediaQuery
//                     .of(context)
//                     .padding
//                     .bottom,
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void onTapped() {
//     print('Doing Something...'); // Print to console.
//   }
// }
// //
// // // Widget inkwell(DrawerList listData) {
// // //   return Material(
// // //     color: Colors.transparent,
// // //     child: InkWell(
// // //       splashColor: Colors.grey.withOpacity(0.1),
// // //       highlightColor: Colors.transparent,
// // //       onTap: () {
// // //         // navigationtoScreen(listData.index!);
// // //       },
// // //       child: Stack(
// // //         children: <Widget>[
// // //           Container(
// // //             padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
// // //             child: Row(
// // //               children: <Widget>[
// // //                 Container(
// // //                   width: 6.0,
// // //                   height: 46.0,
// // //                   // decoration: BoxDecoration(
// // //                   //   color: widget.screenIndex == listData.index
// // //                   //       ? Colors.blue
// // //                   //       : Colors.transparent,
// // //                   //   borderRadius: new BorderRadius.only(
// // //                   //     topLeft: Radius.circular(0),
// // //                   //     topRight: Radius.circular(16),
// // //                   //     bottomLeft: Radius.circular(0),
// // //                   //     bottomRight: Radius.circular(16),
// // //                   //   ),
// // //                   // ),
// // //                 ),
// // //                 const Padding(
// // //                   padding: EdgeInsets.all(4.0),
// // //                 ),
// // //                 listData.isAssetsImage
// // //                     ? Container(
// // //                   width: 24,
// // //                   height: 24,
// // //                   child: Image.asset(listData.imageName,
// // //                       color: widget.screenIndex == listData.index ? Colors
// // //                           .blue : AppTheme.nearlyBlack),
// // //                 )
// // //                     : Icon(listData.icon?.icon,
// // //                     color: widget.screenIndex == listData.index
// // //                         ? Colors.blue
// // //                         : AppTheme.nearlyBlack),
// // //                 const Padding(
// // //                   padding: EdgeInsets.all(4.0),
// // //                 ),
// // //                 Text(
// // //                   listData.labelName,
// // //                   style: TextStyle(
// // //                     fontWeight: FontWeight.w500,
// // //                     fontSize: 16,
// // //                     color: widget.screenIndex == listData.index
// // //                         ? Colors.blue
// // //                         : AppTheme.nearlyBlack,
// // //                   ),
// // //                   textAlign: TextAlign.left,
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           widget.screenIndex == listData.index
// // //               ? AnimatedBuilder(
// // //             animation: widget.iconAnimationController!,
// // //             builder: (BuildContext context, Widget? child) {
// // //               return Transform(
// // //                 transform: Matrix4.translationValues(
// // //                     (MediaQuery
// // //                         .of(context)
// // //                         .size
// // //                         .width * 0.75 - 64) *
// // //                         (1.0 - widget.iconAnimationController!.value - 1.0),
// // //                     0.0, 0.0),
// // //                 child: Padding(
// // //                   padding: EdgeInsets.only(top: 8, bottom: 8),
// // //                   child: Container(
// // //                     width: MediaQuery
// // //                         .of(context)
// // //                         .size
// // //                         .width * 0.75 - 64,
// // //                     height: 46,
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.blue.withOpacity(0.2),
// // //                       borderRadius: new BorderRadius.only(
// // //                         topLeft: Radius.circular(0),
// // //                         topRight: Radius.circular(28),
// // //                         bottomLeft: Radius.circular(0),
// // //                         bottomRight: Radius.circular(28),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           )
// // //               : const SizedBox()
// // //         ],
// // //       ),
// // //     ),
// // //   );
// // // }
// //
// // //   Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
// // //     widget.callBackIndex!(indexScreen);
// // //   }
// // // }
// // //
// // // enum DrawerIndex {
// // //   HOME,
// // //   FeedBack,
// // //   Help,
// // //   Share,
// // //   About,
// // //   Invite,
// // //   Testing,
// // // }
// //
// // // class DrawerList {
// // //   DrawerList({
// // //     this.isAssetsImage = false,
// // //     this.labelName = '',
// // //     this.icon,
// // //     this.index,
// // //     this.imageName = '',
// // //   });
// // //
// // //   String labelName;
// // //   Icon? icon;
// // //   bool isAssetsImage;
// // //   String imageName;
// // //   DrawerIndex? index;
// // // }
// // // class Profil extends StatelessWidget{
// // //   late User user;
// // //   @override
// // //   Widget build(BuildContext context) {
// // //
// // //     AuthService fetchApi=AuthService();
// // //     return SingleChildScrollView(
// // //       child: Column(
// // //       children: <Widget>[
// // //         Padding(
// // //           padding: const EdgeInsets.only(top: 100),
// // //           child: FutureBuilder(
// // //             future: fetchApi.getUsername(),
// // //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// // //               if (snapshot.data == null) {
// // //                 Logger().d(snapshot.data);
// // //                 Logger().d('erreur Fetching Data');
// // //                 return Container(child: Center(child: CircularProgressIndicator(),));
// // //               }
// // //               return Text('${snapshot.data}');
// // //             },
// // //
// // //     ),
// // //         ),
// // //         Padding(
// // //           padding: const EdgeInsets.only(top: 100),
// // //           child: FutureBuilder(
// // //             future: fetchApi.getfirstname(),
// // //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// // //               if (snapshot.data == null) {
// // //                 Logger().d(snapshot.data);
// // //                 Logger().d('erreur Fetching Data');
// // //                 return Container(child: Center(child: CircularProgressIndicator(),));
// // //               }
// // //               return Text('${snapshot.data}');
// // //             },
// // //           ),
// // //         ),
// // //         Padding(
// // //           padding: const EdgeInsets.only(top: 100),
// // //           child: FutureBuilder(
// // //             future: fetchApi.getlastname(),
// // //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// // //               if (snapshot.data == null) {
// // //                 Logger().d(snapshot.data);
// // //                 Logger().d('erreur Fetching Data');
// // //                 return Container(child: Center(child: CircularProgressIndicator(),));
// // //               }
// // //               return Text('${snapshot.data}');
// // //             },
// // //           ),
// // //         ),
// // //         Padding(
// // //           padding: const EdgeInsets.only(top: 100),
// // //           child: FutureBuilder(
// // //             future: fetchApi.getimageUrl(),
// // //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// // //               var blob = snapshot.data;
// // //               Uint8List imageUri = Base64Codec().decode(blob);
// // //               if (snapshot.data == null) {
// // //                 Logger().d(snapshot.data);
// // //                 Logger().d('erreur Fetching Data');
// // //                 return Container(child: Center(child: CircularProgressIndicator(),));
// // //               }
// // //               // return Text('${snapshot.data}');
// // //               return Image.memory(imageUri,fit:BoxFit.fill,width: 90,height: 90,);
// // //             },
// // //           ),
// // //         ),
// // //       ],
// // //       ),
// // //     );
// // //   }
// // //
// // // }
// //
// // }
import 'dart:convert';
import 'dart:typed_data';

import 'package:Campingo/services/AuthService.dart';
import 'package:Campingo/views/LoginView/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Profil extends StatelessWidget {
  AuthService fetchApi=AuthService();
  Widget textfield({@required hintText}) {

    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Padding(
          padding: const EdgeInsets.only(top: 5),
          child: FutureBuilder(
            future: fetchApi.getUsername(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                Logger().d(snapshot.data);
                Logger().d('erreur Fetching Data');
                return Container(child: Center(child: CircularProgressIndicator(),));
              }
              return Text('${snapshot.data}');
            },
          ),
        ),
                    Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FutureBuilder(
            future: fetchApi.getemail() ,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                Logger().d(snapshot.data);
                Logger().d('erreur Fetching Data');
                return Container(child: Center(child: CircularProgressIndicator(),));
              }
              return Text('${snapshot.data}');
            },
          ),
        ),

                    Container(
                      height: 55,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.black54,
                        child: Center(
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 55,
                      width: double.infinity,
                      child:   RaisedButton(
                        elevation: 0,
                        hoverElevation: 0,
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>Login()));
                        },
                        child: Icon(Icons.login_rounded),
                        // backgroundColor: appTheme.primaryColor.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: FutureBuilder(
                  future: fetchApi.getimageUrl(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var blob = snapshot.data;
                    if (snapshot.data == null) {
                      Logger().d(snapshot.data);
                      Logger().d('assets/imgs/blan.png');
                      return Container(child: Center(child: CircularProgressIndicator(),));

                    }
                    Uint8List imageUri = Base64Codec().decode(blob)  ;
                    if (snapshot.data == null) {
                      Logger().d(snapshot.data);
                      Logger().d('erreur Fetching Data');
                      return Container(child: Center(child: CircularProgressIndicator(),));

                    }
                    // return Text('${snapshot.data}');

                    return Image.memory(imageUri,width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,);
                  },
                ),

                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/imgs/blan.png'),
                  ),
                ),
              ),

            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),

        ],
      ),
    );

  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}