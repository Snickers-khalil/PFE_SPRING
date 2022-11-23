import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:Campingo/constants/Theme.dart';
import 'package:Campingo/controllers/EvennementController.dart';
import 'package:Campingo/controllers/RandonnerController.dart';
import 'package:Campingo/models/EvennmentModel.dart';
import 'package:Campingo/models/RandonnerModel.dart';
import 'package:Campingo/views/Randonner/AddRand.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
class Evennement extends StatefulWidget {
  // Randonner() : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _EvennementPageState();
  }
}
class _EvennementPageState extends State<Evennement> {
  TextEditingController adressController = TextEditingController();
  TextEditingController programmeController = TextEditingController();
  TextEditingController cercuitController = TextEditingController();
  TextEditingController diffcuiltController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  late EvennementModel evenement;
  late String codeDialog;
  late String valueText;

  var orientation;
  Future<void> NetworkGiffyDialog(BuildContext context) async {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 26,
          // hoverElevation: 0,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => AddRandonner() ));
            //AddRandonner();
          },
          child: Icon(Icons.add_circle),
          backgroundColor: NowUIColors.logo,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: NowUIColors.bgColorScreen,
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child:Padding(
                      padding: const EdgeInsets.only(bottom: 150),
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/imgs/pic4.jpg"),
                                  fit: BoxFit.fill)),

                      ),
                    )

                ),
                Expanded(
                  child: Container(
                      child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 32.0, right: 32.0),
                            child: Column(children: [
                              Text(" 𝑬𝒗𝒆𝒏𝒕 𝑪𝑨𝑴𝑷𝑰𝑵𝑮𝑶",
                                  style: TextStyle(
                                      color: NowUIColors.text,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24, top: 5),
                                child: Text(
                                    "𝙽𝚘 𝚒𝚗𝚝𝚎𝚛𝚗𝚎𝚝 , 𝙽𝚘 𝚜𝚘𝚌𝚒𝚊𝚕 𝚖𝚎𝚍𝚒𝚊 . 𝚕𝚎𝚝𝚜 𝚐𝚘 𝚏𝚘𝚛 𝚊 𝚠𝚒𝚕𝚍  𝚌𝚊𝚖𝚙𝚒𝚗𝚐 𝚏𝚘𝚛 𝚜𝚘𝚖𝚎 𝚍𝚊𝚢𝚜 🍁.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: NowUIColors.time)),
                              ),
                              Container(
                                child: FutureBuilder(
                                  future: GetallEvents(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    if (snapshot.data == null) {
                                      return Container(child: Center(child: CircularProgressIndicator(),));
                                    }
                                    return GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 5.0,
                                        mainAxisSpacing: 5.0,),
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        var blob = snapshot.data[index].imageUrl;
                                        Uint8List imageUri = Base64Codec().decode(blob);
                                        return  Center(
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                Stack(
                                                    alignment: Alignment.center,
                                                    children:[
                                                      Image.memory(imageUri,fit:BoxFit.fill,width: 400,height: 200,),
                                                      // Ink.image(
                                                      //   height:80,
                                                      //   image:AssetImage('assets/imgs/pic.jpg',),
                                                      //   fit:BoxFit.fitWidth,
                                                      // )
                                                    ]
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailPage(snapshot.data[index])));
                                                  },
                                                  title:Text(
                                                    '${snapshot.data[index].title}',
                                                    style: TextStyle(color: Colors.black.withOpacity(0.4),),
                                                  ),
                                                 // leading: Icon(Icons.arrow_drop_down_circle),
                                                  subtitle: Text(
                                                    'Details',
                                                    style: TextStyle(color: Colors.indigo.withOpacity(0.4),),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              // PhotoAlbum(imgArray: imgArray)
                            ]),
                          ))),
                ),
              ],
            ),

          ],
        ));

  }
}


class DetailPage extends StatelessWidget {
  EvennementModel event;
  DetailPage(this.event);
  @override
  Widget build(BuildContext context) {
    var blob = '${event.imageUrl}';
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
            color: Color(0xFF988996),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${event.title}',style: Theme.of(context).textTheme.headline3),
              Text('${event.descriptione}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('Debut le  '+'${event.debut_event}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('finit le  '+'${event.fin_event}',
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

