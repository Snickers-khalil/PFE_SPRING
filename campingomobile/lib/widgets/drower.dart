// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:Campingo/constants/Theme.dart';
// import 'package:Campingo/widgets/drawer-tile.dart';

// class NowDrawer extends StatelessWidget {
//   final String currentPage;

//   NowDrawer({required this.currentPage});

//   _launchURL() async {
//     const url = 'https://creative-tim.com';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Container(
//       color: NowUIColors.primary,
//       child: Column(children: [
//         Container(
//             height: MediaQuery.of(context).size.height * 0.1,
//             width: MediaQuery.of(context).size.width * 0.85,
//             child: SafeArea(
//               bottom: false,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 24.0, right: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.baseline,
//                   textBaseline: TextBaseline.alphabetic,
//                   children: [
//                     Image.asset("assets/imgs/log.gif"),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: IconButton(
//                           icon: Icon(Icons.menu,
//                               color: NowUIColors.trans.withOpacity(0.82),
//                               size: 24.0),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             )),
//         Expanded(
//           flex: 2,
//           child: ListView(
//             padding: EdgeInsets.only(top: 36, left: 8, right: 16),
//             children: [
//               DrawerTile(
//                   icon: FontAwesomeIcons.home,
//                   onTap: () {
//                     if (currentPage != "Home")
//                       Navigator.pushReplacementNamed(context, '/home');
//                   },
//                   iconColor: NowUIColors.trans,
//                   title: "Home",
//                   isSelected: currentPage == "Home" ? true : false),

//               DrawerTile(
//                   icon: FontAwesomeIcons.dharmachakra,
//                   onTap: () {
//                     if (currentPage != "Randonner")
//                       Navigator.pushReplacementNamed(context, '/rand');
//                   },
//                   iconColor: NowUIColors.error,
//                   title: "Randonner",
//                   isSelected: currentPage == "rand" ? true : false),
//               DrawerTile(
//                   icon: FontAwesomeIcons.dharmachakra,
//                   onTap: () {
//                     if (currentPage != "Evenment")
//                       Navigator.pushReplacementNamed(context, '/event');
//                   },
//                   iconColor: NowUIColors.primary,
//                   title: "Evenment",
//                   isSelected: currentPage == "event" ? true : false),
//               DrawerTile(
//                   icon: FontAwesomeIcons.dharmachakra,
//                   onTap: () {
//                     if (currentPage != "Annonce")
//                       Navigator.pushReplacementNamed(context, '/ann');
//                   },
//                   iconColor: NowUIColors.error,
//                   title: "Annonce",
//                   isSelected: currentPage == "ann" ? true : false),
//               DrawerTile(
//                   icon: FontAwesomeIcons.newspaper,
//                   onTap: () {
//                     if (currentPage != "Articles")
//                       Navigator.pushReplacementNamed(context, '/articles');
//                   },
//                   iconColor: NowUIColors.primary,
//                   title: "Articles",
//                   isSelected: currentPage == "Articles" ? true : false),
//               DrawerTile(
//                   icon: FontAwesomeIcons.user,
//                   onTap: () {
//                     if (currentPage != "Profile")
//                       Navigator.pushReplacementNamed(context, '/profile');
//                   },
//                   iconColor: NowUIColors.warning,
//                   title: "Profile",
//                   isSelected: currentPage == "Profile" ? true : false),
//               DrawerTile(
//                   icon: FontAwesomeIcons.fileInvoice,
//                   onTap: () {
//                     if (currentPage != "Account")
//                       Navigator.pushReplacementNamed(context, '/account');
//                   },
//                   iconColor: NowUIColors.info,
//                   title: "Account",
//                   isSelected: currentPage == "Account" ? true : false),
//               DrawerTile(
//                   icon: FontAwesomeIcons.cog,
//                   onTap: () {
//                     if (currentPage != "Settings")
//                       Navigator.pushReplacementNamed(context, '/settings');
//                   },
//                   iconColor: NowUIColors.success,
//                   title: "Settings",
//                   isSelected: currentPage == "Settings" ? true : false),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//               padding: EdgeInsets.only(left: 8, right: 16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Divider(
//                       height: 4,
//                       thickness: 0,
//                       color: NowUIColors.white.withOpacity(0.8)),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
//                     child: Text("DOCUMENTATION",
//                         style: TextStyle(
//                           color: NowUIColors.white.withOpacity(0.8),
//                           fontSize: 13,
//                         )),
//                   ),
//                   DrawerTile(
//                       icon: FontAwesomeIcons.satellite,
//                       onTap: _launchURL,
//                       iconColor: NowUIColors.muted,
//                       title: "Getting Started",
//                       isSelected:
//                           currentPage == "Getting started" ? true : false),
//                 ],
//               )),
//         ),
//       ]),
//     ));
//   }
// }
