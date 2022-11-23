import 'package:Campingo/models/UserModel.dart';
import 'package:Campingo/views/Annonces/AnnonceView.dart';
import 'package:Campingo/views/Evennement/EvennementView.dart';
import 'package:Campingo/views/HomeView/HomeView.dart';
import 'package:Campingo/views/ProfilView/Profile.dart'as prefix0;
import 'package:Campingo/views/Randonner/AddRand.dart';
import 'package:Campingo/views/Randonner/RandonnerView.dart';
import 'package:flutter/material.dart';

int sel = 0;
double? width;
double? height;
final bodies = [HomeView(), Annonce(), Randonner(), Evennement(), prefix0.Profil()];

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<BottomNavigationBarItem> createItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
           color: Colors.blueAccent,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: "Home"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.shop,
           color: Colors.blueAccent,
        ),
        icon: Icon(
          Icons.shop,
          color: Colors.black,
        ),
        label: "Annonces"));
        items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.park_rounded,
           color: Colors.blueAccent,
        ),
        icon: Icon(
          Icons.park_rounded,
          color: Colors.black,
        ),
        label: "Randonner"));
         items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.event,
           color: Colors.blueAccent,
        ),
        icon: Icon(
          Icons.event,
          color: Colors.black,
        ),
        label: "Evennement"));
     items.add(BottomNavigationBarItem(
        // activeIcon: Icon(
        //   Icons.person,
        //    color: Colors.blueAccent,
        // ),
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        label: "Profil"));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodies.elementAt(sel),
        bottomNavigationBar: BottomNavigationBar(
          items: createItems(),
          unselectedItemColor: Colors.black,
           selectedItemColor: Colors.blueAccent,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: sel,
          elevation: 1.5,
          onTap: (int index) {
            if (index != sel)
              setState(() {
                sel = index;
              });
          },
        ));
  }
}
