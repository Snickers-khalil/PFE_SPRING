import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';


class Details extends StatelessWidget {
  _renderBg() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFFFFFFF)),
    );
  }


  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFF949996),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Front', style: Theme.of(context).textTheme.headline1),
              Text('Click here to flip back',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Back', style: Theme.of(context).textTheme.headline1),
              Text('Click here to flip front',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlipCard'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: _renderContent(context),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}








// import 'dart:io';
// import 'package:Campingo/views/FirstBoard/BottomNav.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_card_swipper/flutter_card_swiper.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'package:Campingo/data/LocalStorage.dart';
// import 'package:Campingo/models/UserModel.dart';
// import 'package:Campingo/views/LoginView/Login.dart';
//
//
//
// LocalStorage? localStorage;
// //var token =  localStorage!.readToken();
//
// class Details extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(bottom: 70),
//             child:Ink.image(
//               height:300,
//               image:AssetImage('assets/imgs/pex.jpg',),
//               fit:BoxFit.fill,
//             ),
//           ),
//           Center(child:
//           Text('Details Annonce')
//           ),
//           // ignore: deprecated_member_use
//           FlatButton(
//             color: Colors.red,
//             textColor: Colors.white,
//             child: Text('Return'),
//             onPressed: () {
//               Navigator.push(context,MaterialPageRoute(builder:(context)=>(BottomNav())));
//               // Navigator.pop();
//             },
//           ),
//         ],
//       ),
//       // body: SingleChildScrollView(
//       //   scrollDirection: Axis.vertical,
//       //   child: Column(
//       //   ),
//       // ),
//     );
//   }
// }
//
//
// // picker()async{
// //   File img=await ImagePicker.pickImage(source: ImageSource.gallery);
// //   if(img!=null){
// //     var image=img;
// //     setState((){
//
// //     });
// //   }
// // }
//
//
// // import 'package:flutter/material.dart';
//
// // class HomeView extends StatefulWidget {
// //   @override
// //   State<HomeView> createState() => _HomeViewState();
// // }
// // class _HomeViewState extends State<HomeView> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: SafeArea(
// //           child: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text("welcome"),
// //              SizedBox(height: 50,),
// //              OutlinedButton.icon(
// //                onPressed: (){},
// //                 icon: Icon(Icons.exit_to_app,size: 18,),
// //                label: Text("Logout")),
// //             ],
// //           ),
// //         )),
// //       ),
// //     );
// //   }
// // }
//
// // @override
// // Widget build(BuildContext context) {
// //   return new Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: new AppBar(
// //         title: new Text(widget.title),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(25),
// //         child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               new Swiper(
// //                 itemBuilder: (BuildContext context, int index) {
// //                   return  Container(
// //                       width: 300.00,
// //                       height: 300.00,
// //                       decoration: new BoxDecoration(
// //                         borderRadius: BorderRadius.circular(20),
// //                         image: new DecorationImage(
// //                           image: ExactAssetImage('assets/images/bg${index}.jpeg'),
// //                           fit: BoxFit.fill,
// //                         ),
// //                       )
// //                   );
// //                 },
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: 3,
// //                 autoplay: true,
// //                 itemHeight: 500,
// //                 itemWidth: 350,
// //                 pagination: new SwiperPagination(),
// //                 layout: SwiperLayout.STACK,
// //               ),
// //               SizedBox(height: 50,),
// //
// //             ]),
// //       )
// //   );
// // }
// // }