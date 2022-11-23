


import 'package:Campingo/design/model/app_theme.dart';
import 'package:Campingo/design/model/homelist.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar(),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return GridView(
                            padding: const EdgeInsets.only(
                                top: 0, left: 12, right: 12),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: List<Widget>.generate(
                              homeList.length,
                                  (int index) {
                                final int count = homeList.length;
                                final Animation<double> animation =
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn),
                                  ),
                                );
                                animationController?.forward();
                                return HomeListView(
                                  animation: animation,
                                  animationController: animationController,
                                  listData: homeList[index],
                                  callBack: () {
                                    Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                        homeList[index].navigateScreen!,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: multiple ? 2 : 1,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0,
                              childAspectRatio: 1.5,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'CAMPINGO',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                  BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: AppTheme.dark_grey,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key? key,
        this.listData,
        this.callBack,
        this.animationController,
        this.animation})
      : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:Campingo/controllers/LoginController.dart';
// import 'package:Campingo/controllers/ProfilController.dart';
// import 'package:Campingo/design/model/app_theme.dart';
// import 'package:Campingo/services/AuthService.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_card_swipper/flutter_card_swiper.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'package:Campingo/data/LocalStorage.dart';
// import 'package:Campingo/models/UserModel.dart';
// import 'package:Campingo/views/LoginView/Login.dart';
// import 'package:logger/logger.dart';
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:Campingo/design/model/homelist.dart';
//
// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<HomeView> with TickerProviderStateMixin {
//   List<HomeList> homeList = HomeList.homeList;
//   AnimationController? animationController;
//   bool multiple = true;
//
//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     super.initState();
//   }
//
//   Future<bool> getData() async {
//     await Future<dynamic>.delayed(const Duration(milliseconds: 0));
//     return true;
//   }
//
//   @override
//   void dispose() {
//     animationController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.white,
//       body: FutureBuilder<bool>(
//         future: getData(),
//         builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//           if (!snapshot.hasData) {
//             return const SizedBox();
//           } else {
//             return Padding(
//               padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   appBar(),
//                   Expanded(
//                     child: FutureBuilder<bool>(
//                       future: getData(),
//                       builder:
//                           (BuildContext context, AsyncSnapshot<bool> snapshot) {
//                         if (!snapshot.hasData) {
//                           return const SizedBox();
//                         } else {
//                           return GridView(
//                             padding: const EdgeInsets.only(
//                                 top: 0, left: 12, right: 12),
//                             physics: const BouncingScrollPhysics(),
//                             scrollDirection: Axis.vertical,
//                             children: List<Widget>.generate(
//                               homeList.length,
//                                   (int index) {
//                                 final int count = homeList.length;
//                                 final Animation<double> animation =
//                                 Tween<double>(begin: 0.0, end: 1.0).animate(
//                                   CurvedAnimation(
//                                     parent: animationController!,
//                                     curve: Interval((1 / count) * index, 1.0,
//                                         curve: Curves.fastOutSlowIn),
//                                   ),
//                                 );
//                                 animationController?.forward();
//                                 return HomeListView(
//                                   animation: animation,
//                                   animationController: animationController,
//                                   listData: homeList[index],
//                                   callBack: () {
//                                     Navigator.push<dynamic>(
//                                       context,
//                                       MaterialPageRoute<dynamic>(
//                                         builder: (BuildContext context) =>
//                                         homeList[index].navigateScreen!,
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                             ),
//                             gridDelegate:
//                             SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: multiple ? 2 : 1,
//                               mainAxisSpacing: 12.0,
//                               crossAxisSpacing: 12.0,
//                               childAspectRatio: 1.5,
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Widget appBar() {
//     return SizedBox(
//       height: AppBar().preferredSize.height,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 8, left: 8),
//             child: Container(
//               width: AppBar().preferredSize.height - 8,
//               height: AppBar().preferredSize.height - 8,
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 4),
//                 child: Text(
//                   'CAMPINGO',
//                   style: TextStyle(
//                     fontSize: 22,
//                     color: AppTheme.darkText,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8, right: 8),
//             child: Container(
//               width: AppBar().preferredSize.height - 8,
//               height: AppBar().preferredSize.height - 8,
//               color: Colors.white,
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   borderRadius:
//                   BorderRadius.circular(AppBar().preferredSize.height),
//                   child: Icon(
//                     multiple ? Icons.dashboard : Icons.view_agenda,
//                     color: AppTheme.dark_grey,
//                   ),
//                   onTap: () {
//                     setState(() {
//                       multiple = !multiple;
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class HomeListView extends StatelessWidget {
//   const HomeListView(
//       {Key? key,
//         this.listData,
//         this.callBack,
//         this.animationController,
//         this.animation})
//       : super(key: key);
//
//   final HomeList? listData;
//   final VoidCallback? callBack;
//   final AnimationController? animationController;
//   final Animation<double>? animation;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animationController!,
//       builder: (BuildContext context, Widget? child) {
//         return FadeTransition(
//           opacity: animation!,
//           child: Transform(
//             transform: Matrix4.translationValues(
//                 0.0, 50 * (1.0 - animation!.value), 0.0),
//             child: AspectRatio(
//               aspectRatio: 1.5,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//                 child: Stack(
//                   alignment: AlignmentDirectional.center,
//                   children: <Widget>[
//                     Positioned.fill(
//                       child: Image.asset(
//                         listData!.imagePath,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         splashColor: Colors.grey.withOpacity(0.2),
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(4.0)),
//                         onTap: callBack,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
//var token =  localStorage!.readToken();

// class HomeView extends StatelessWidget {
//   AuthService fetchApi=AuthService();
// LocalStorage storage= LocalStorage();
//
//   // final username=new TextEditingController();
//   // late File image;
//   // late String imgUrl;
//   // Future<User> user = ProfilController().getLoggedInUserObject();
// Future<User> getLoggedInUserObject() async {
//   Map<String, dynamic> res = await AuthService().getMe();
//   User? user = User.fromJson(res);
//   // _user = user_FromJson;
//   Logger().d("user_FromJson : ${user.username}");
//   return user;
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:Colors.grey,
//         title: Column(
//           children: [
//             //Image.asset("assets/imgs/logo.gif"),
//            // Text('Welcome To Campingo${}'),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           // Padding(
//           //   padding: EdgeInsets.all(25),
//           //   child:InkWell(
//           //    // onTap:()=> getImage(),
//           //     child: CircleAvatar(
//           //     radius: 100,
//           //     //backgroundImage: image != null ? FileImage(image):NetworkImage('null'),
//           //     ),
//           //   ) ,
//           // ),
//
//           Padding(
//             padding: const EdgeInsets.only(top: 60),
//             child: new Swiper(
//               itemBuilder: (BuildContext context, int index) {
//                 return  Container(
//                     width: 500,
//                     height: 500,
//                     decoration: new BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: new DecorationImage(
//                         image: ExactAssetImage('assets/imgs/pic${index}.jpg'),
//                         fit: BoxFit.fill,
//                       ),
//                     )
//                 );
//               },
//               scrollDirection: Axis.horizontal,
//               itemCount: 6,
//               autoplay: true,
//               itemHeight: 600,
//               itemWidth: 620,
//               pagination: new SwiperPagination(),
//               layout: SwiperLayout.STACK,
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         elevation: 0,
//         hoverElevation: 0,
//         onPressed: () {
//        Navigator.push(context,MaterialPageRoute(builder:(context)=>Login()));
//         },
//         child: Icon(Icons.login_rounded),
//         // backgroundColor: appTheme.primaryColor.withOpacity(.5),
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