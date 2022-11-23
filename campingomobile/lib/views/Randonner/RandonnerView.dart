import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:Campingo/constants/Theme.dart';
import 'package:Campingo/controllers/RandonnerController.dart';
import 'package:Campingo/models/RandonnerModel.dart';
import 'package:Campingo/views/Randonner/AddRand.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
class Randonner extends StatefulWidget {
  // Randonner() : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RandonnerPageState();
  }
}
class _RandonnerPageState extends State<Randonner> {
  TextEditingController adressController = TextEditingController();
  TextEditingController programmeController = TextEditingController();
  TextEditingController cercuitController = TextEditingController();
  TextEditingController diffcuiltController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  late RandonnerModel randonner;
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
         elevation: 10,
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
                                  image: AssetImage("assets/imgs/mat.jpg"),
                                  fit: BoxFit.cover)),
                          child: Stack(

                          )
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
                              Text("𝑻𝒓𝒆𝒌 𝒄𝒂𝒎𝒑𝒊𝒏𝒈𝒐",
                                  style: TextStyle(
                                      color: NowUIColors.text,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24, top: 5),
                                child: Text(
                                    "𝙲𝚊𝚖𝚙𝚒𝚗𝚐 𝚛𝚞𝚕𝚎𝚜. 𝚂𝚝𝚊𝚛𝚎 𝚊𝚝 𝚝𝚑𝚎 𝚏𝚒𝚛𝚎. 𝙻𝚒𝚜𝚝𝚎𝚗 𝚝𝚘 𝚝𝚑𝚎 𝚋𝚒𝚛𝚍𝚜. 𝙹𝚞𝚖𝚙 𝚒𝚗 𝚝𝚑𝚎 𝚕𝚊𝚔𝚎. 𝚁𝚎𝚊𝚍. 𝚃𝚊𝚔𝚎 𝚊 𝚗𝚊𝚙. 𝚁𝚎𝚕𝚊𝚡. 𝚆𝚊𝚝𝚌𝚑 𝚝𝚑𝚎 𝚜𝚞𝚗𝚜𝚎𝚝. 𝙲𝚘𝚘𝚔 𝚘𝚟𝚎𝚛 𝚝𝚑𝚎 𝚏𝚒𝚛𝚎. 𝙱𝚛𝚎𝚊𝚝𝚑𝚎 𝚝𝚑𝚎 𝚏𝚛𝚎𝚜𝚑 𝚊𝚒𝚛",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: NowUIColors.time)),
                              ),                         
                          Container(
                          child: FutureBuilder(
                          future: GetallRandonner(),
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
                              Uint8List imageUri = Base64Codec().decode(blob); // image is a Uint8List
                              return  Center(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      Stack(
                                          alignment: Alignment.bottomLeft,
                                          children:[
                                            Image.memory(imageUri,fit:BoxFit.fill,width: 400,height: 200,),
                                          ]
                                      ),
                                      ListTile(
                                       // leading: Icon(Icons.arrow_drop_down_circle),
                                       title:  Text(
                                         '${snapshot.data[index].adress}',
                                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                                         ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPage(snapshot.data[index])));                                          // Get.toNamed('/details', arguments: [snapshot.data[index].id,
                                        },
                                        subtitle: Text(
                                          'Details',
                                          style: TextStyle(color: Colors.indigo.withOpacity(0.4),),
                                        ),
                                        // subtitle: Text(
                                        //   '${snapshot.data[index].cercuit}',
                                        //   style: TextStyle(color: Colors.black.withOpacity(0.4)),
                                        // ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(1.0),
                                      //   // child: Text(
                                      //   //   '${snapshot.data[index].programme}',
                                      //   //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                      //   // ),
                                      // ),
                                      // ButtonBar(
                                      //   alignment: MainAxisAlignment.start,
                                      //   children: [
                                      //    // ignore: deprecated_member_use
                                      //     FlatButton(
                                      //       textColor: const Color(0xFF6200EE),
                                      //       onPressed: () {
                                      //         // Perform some action
                                      //       },
                                      //       child: const Text('ACTION 1'),
                                      //     ),
                                      //     // ignore: deprecated_member_use
                                      //     FlatButton(
                                      //       textColor: const Color(0xFF6200EE),
                                      //       onPressed: () {
                                      //         // Perform some action
                                      //       },
                                      //       child: const Text('ACTION 2'),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Image.asset('assets/imgs/pic3.jpg'),
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
  RandonnerModel rand;
  DetailPage(this.rand);
  @override
  Widget build(BuildContext context) {
    var blob = '${rand.imageUrl}';
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
              Text('${rand.adress}',style: Theme.of(context).textTheme.headline3),
              Text('${rand.programme}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${rand.cercuit} Klm',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${rand.difficult}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('le  '+'${rand.date}',
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
