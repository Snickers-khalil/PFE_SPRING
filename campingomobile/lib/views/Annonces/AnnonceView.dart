import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:Campingo/constants/Theme.dart';
import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/controllers/AnnonceController.dart';
import 'package:Campingo/design/hotel_booking/hotel_app_theme.dart';
import 'package:Campingo/models/AnnonceModel.dart';
import 'package:Campingo/models/RandonnerModel.dart';
import 'package:Campingo/views/Annonces/AddAnnonce.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import 'AddAnnonce.dart';
import 'AddAnnonce.dart';

class Annonce extends StatefulWidget {
  // Annonce() : super(key: key);
  @override
  _AnnoncePageState createState() => _AnnoncePageState();

}
class _AnnoncePageState extends State<Annonce> {

  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi=FetchApi();
    return Scaffold(
       floatingActionButton: FloatingActionButton(
         elevation: 16,
        // hoverElevation: 0,
        onPressed: () {
            AddAnnonce(context);
           },
        child: Icon(Icons.add_circle),
         backgroundColor: NowUIColors.logo,
      ),
        extendBodyBehindAppBar: true,
        backgroundColor: NowUIColors.bgColorScreen,
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/imgs/shop.jpg"),
                                fit: BoxFit.cover)),
                        child: Stack(
                          children: <Widget>[
                          ],
                        )),
                  ),

                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 32.0, right: 32.0),
                            child: Column(
                              children: [
                                  Text("𝑺𝑯𝑶𝑷 𝑪𝑨𝑴𝑷𝑰𝑵𝑮𝑶",
                                     style: TextStyle(
                                      color: NowUIColors.text,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0)
                                    ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0, right: 24, top: 5),
                                  child: Text(
                                      "𝐾𝑒𝑒𝑝 𝐶𝑎𝑙𝑚 𝐴𝑛𝑑 𝐶𝑎𝑚𝑝 𝑂𝑛 !!️.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: NowUIColors.time)),
                                ),

                              Container(
                                child: FutureBuilder(
                               future: fetchApi.getAnnonces(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                   if (snapshot.data == null) {
                                     Logger().d(snapshot.data);
                                     Logger().d('erreur Fetching Data');
                                     return Container(child: Center(child: CircularProgressIndicator(),));
                                   }
                               return GridView.builder(
                                 physics: NeverScrollableScrollPhysics(),
                                 shrinkWrap: true,
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 2,
                                   crossAxisSpacing: 4.0,
                                   mainAxisSpacing: 5.0,
                                 ),
                                 scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var blob = snapshot.data[index].imageUrl;
                              Uint8List imageUri = Base64Codec().decode(blob);
                              return  Center(
                                child: Card(
                                  elevation: 5,
                                //  margin: const EdgeInsets.only(top: 50.0),
                                  clipBehavior: Clip.antiAlias,
                                 // child: SingleChildScrollView(
                                    child: Column(
                                      //mainAxisAlignment: orientation,
                                      children: [
                                        Stack(
                                            children:[
                                              Image.memory(imageUri,fit:BoxFit.fill,width: 90,height: 90,),
                                            ]
                                        ),
                                        ListTile(
                                         // leading: Icon(Icons.arrow_drop_down_circle),
                                         title:  Text(
                                           '${snapshot.data[index].titre}',
                                            // snapshot.data[index].setup,
                                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                           ),
                                          subtitle: Text(
                                            'Details',
                                            style: TextStyle(color: Colors.indigo.withOpacity(0.4),),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailPage(snapshot.data[index])));
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(0.3),
                                        ),
                                      ],
                                    ),
                                  ),
                              //  ),
                              );
                                }, 
                                );
                               },
                              ),
                              ),

                            ]),
                          ))),
                ),
              ],
            ),
          
          ],
        ));}}


class DetailPage extends StatelessWidget {
  AnnonceMo annonce;
  DetailPage(this.annonce);
  @override
  Widget build(BuildContext context) {
    var blob = '${annonce.imageUrl}';
    Uint8List imageUri = Base64Codec().decode(blob);
    return Card(
      elevation: 20.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 100.0, bottom: 50.0),
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
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.memory(imageUri,fit:BoxFit.fill,),
              Text('Click to see Details',style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF5F1F1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${annonce.titre}',style: Theme.of(context).textTheme.headline3),
              Text('${annonce.description}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${annonce.adresse}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${annonce.phone}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${annonce.date_ajout}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${annonce.prix}'+' DT',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('${annonce.titre}'),
    //   ),
    //   body: Stack(
    //     fit: StackFit.expand,
    //     children: <Widget>[
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: <Widget>[
    //           Expanded(
    //             flex: 1,
    //             child: Text('${annonce.titre}'
    //             ),
    //           ),
    //           Expanded(
    //             flex: 4,
    //             child: _renderContent(context),
    //           ),
    //           //Image.memory(imageUri,fit:BoxFit.fill,),
    //           Expanded(
    //             flex: 1,
    //             child: Container(
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    //   // Container(
    //   //   child: Column(
    //   //     children: [
    //   //       Expanded(
    //   //         flex: 1,
    //   //         child: _renderContent(context),
    //   //       ),
    //   //      // Image.memory(imageUri,fit:BoxFit.fill,),
    //   //      //  Text('Description' +
    //   //      //      ' ' +
    //   //      //      '${annonce.description}' +
    //   //      //      ' ' +
    //   //      //      'LastName' +
    //   //      //      '${annonce.adresse}'),
    //   //     ],
    //   //   ),
    //   // ),
    // );
  }
}
