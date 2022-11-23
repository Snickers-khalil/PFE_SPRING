
import 'dart:convert';
import 'dart:typed_data';

import 'package:Campingo/controllers/EvennementController.dart';
import 'package:Campingo/models/EvennmentModel.dart';
import 'package:Campingo/views/Annonces/AnnonceView.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'hotel_app_theme.dart';
import 'model/hotel_list_data.dart';

class HotelListView extends StatelessWidget {
  const HotelListView(
      {Key? key,
      this.hotelData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final HotelListData? hotelData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
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
                          Image.memory(imageUri,fit:BoxFit.fill,width: 1000,height: 250,),
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
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),

                      leading: Icon(Icons.arrow_drop_down_circle),
                      subtitle: Text(
                        'Details',
                        style: TextStyle(color: Colors.indigo.withOpacity(0.4),),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 4),
                      child: Row(
                        children: <Widget>[
                          RatingBar(
                            initialRating:
                            hotelData!.rating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 0,
                            itemSize: 24,
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star_rate_rounded,
                                color: HotelAppTheme
                                    .buildLightTheme()
                                    .primaryColor,
                              ),
                              half: Icon(
                                Icons.star_half_rounded,
                                color: HotelAppTheme
                                    .buildLightTheme()
                                    .primaryColor,
                              ),
                              empty: Icon(
                                Icons
                                    .star_border_rounded,
                                color: HotelAppTheme
                                    .buildLightTheme()
                                    .primaryColor,
                              ),
                            ),
                            itemPadding:
                            EdgeInsets.zero,
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          // Text(
                          //   ' ${hotelData!.reviews} ',
                          //   style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.grey
                          //           .withOpacity(0.8)),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
    // return AnimatedBuilder(
    //   animation: animationController!,
    //   builder: (BuildContext context, Widget? child) {
    //     return FadeTransition(
    //       opacity: animation!,
    //       child: Transform(
    //         transform: Matrix4.translationValues(
    //             0.0, 50 * (1.0 - animation!.value), 0.0),
    //         child: Padding(
    //           padding: const EdgeInsets.only(
    //               left: 24, right: 24, top: 8, bottom: 16),
    //           child: InkWell(
    //             splashColor: Colors.transparent,
    //             onTap: callback,
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //                 boxShadow: <BoxShadow>[
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.6),
    //                     offset: const Offset(4, 4),
    //                     blurRadius: 16,
    //                   ),
    //                 ],
    //               ),
    //               child: ClipRRect(
    //                 borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //                 child: Stack(
    //                   children: <Widget>[
    //                     Column(
    //                       children: <Widget>[
    //                         AspectRatio(
    //                           aspectRatio: 2,
    //                           child: Image.asset(
    //                             hotelData!.imagePath,
    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                         Container(
    //                           color: HotelAppTheme.buildLightTheme()
    //                               .backgroundColor,
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: <Widget>[
    //                               Expanded(
    //                                 child: Container(
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.only(
    //                                         left: 16, top: 8, bottom: 8),
    //                                     child: Column(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.center,
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.start,
    //                                       children: <Widget>[
    //                                         Text(
    //                                           hotelData!.titleTxt,
    //                                           textAlign: TextAlign.left,
    //                                           style: TextStyle(
    //                                             fontWeight: FontWeight.w600,
    //                                             fontSize: 22,
    //                                           ),
    //                                         ),
    //                                         Row(
    //                                           crossAxisAlignment:
    //                                               CrossAxisAlignment.center,
    //                                           mainAxisAlignment:
    //                                               MainAxisAlignment.start,
    //                                           children: <Widget>[
    //                                             Text(
    //                                               hotelData!.subTxt,
    //                                               style: TextStyle(
    //                                                   fontSize: 14,
    //                                                   color: Colors.grey
    //                                                       .withOpacity(0.8)),
    //                                             ),
    //                                             const SizedBox(
    //                                               width: 4,
    //                                             ),
    //                                             Icon(
    //                                               FontAwesomeIcons.mapMarkerAlt,
    //                                               size: 12,
    //                                               color: HotelAppTheme
    //                                                       .buildLightTheme()
    //                                                   .primaryColor,
    //                                             ),
    //                                             Expanded(
    //                                               child: Text(
    //                                                 '${hotelData!.dist.toStringAsFixed(1)} km to city',
    //                                                 overflow:
    //                                                     TextOverflow.ellipsis,
    //                                                 style: TextStyle(
    //                                                     fontSize: 14,
    //                                                     color: Colors.grey
    //                                                         .withOpacity(0.8)),
    //                                               ),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                         Padding(
    //                                           padding:
    //                                               const EdgeInsets.only(top: 4),
    //                                           child: Row(
    //                                             children: <Widget>[
    //                                               RatingBar(
    //                                                 initialRating:
    //                                                     hotelData!.rating,
    //                                                 direction: Axis.horizontal,
    //                                                 allowHalfRating: true,
    //                                                 itemCount: 5,
    //                                                 itemSize: 24,
    //                                                 ratingWidget: RatingWidget(
    //                                                   full: Icon(
    //                                                     Icons.star_rate_rounded,
    //                                                     color: HotelAppTheme
    //                                                             .buildLightTheme()
    //                                                         .primaryColor,
    //                                                   ),
    //                                                   half: Icon(
    //                                                     Icons.star_half_rounded,
    //                                                     color: HotelAppTheme
    //                                                             .buildLightTheme()
    //                                                         .primaryColor,
    //                                                   ),
    //                                                   empty: Icon(
    //                                                     Icons
    //                                                         .star_border_rounded,
    //                                                     color: HotelAppTheme
    //                                                             .buildLightTheme()
    //                                                         .primaryColor,
    //                                                   ),
    //                                                 ),
    //                                                 itemPadding:
    //                                                     EdgeInsets.zero,
    //                                                 onRatingUpdate: (rating) {
    //                                                   print(rating);
    //                                                 },
    //                                               ),
    //                                               Text(
    //                                                 ' ${hotelData!.reviews} Reviews',
    //                                                 style: TextStyle(
    //                                                     fontSize: 14,
    //                                                     color: Colors.grey
    //                                                         .withOpacity(0.8)),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                               Padding(
    //                                 padding: const EdgeInsets.only(
    //                                     right: 16, top: 8),
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.end,
    //                                   children: <Widget>[
    //                                     Text(
    //                                       '\$${hotelData!.perNight}',
    //                                       textAlign: TextAlign.left,
    //                                       style: TextStyle(
    //                                         fontWeight: FontWeight.w600,
    //                                         fontSize: 22,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       '/per night',
    //                                       style: TextStyle(
    //                                           fontSize: 14,
    //                                           color:
    //                                               Colors.grey.withOpacity(0.8)),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     Positioned(
    //                       top: 8,
    //                       right: 8,
    //                       child: Material(
    //                         color: Colors.transparent,
    //                         child: InkWell(
    //                           borderRadius: const BorderRadius.all(
    //                             Radius.circular(32.0),
    //                           ),
    //                           onTap: () {},
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Icon(
    //                               Icons.favorite_border,
    //                               color: HotelAppTheme.buildLightTheme()
    //                                   .primaryColor,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
  // Widget build(BuildContext context) {
  //   return AnimatedBuilder(
  //     animation: animationController!,
  //     builder: (BuildContext context, Widget? child) {
  //       return FadeTransition(
  //         opacity: animation!,
  //         child: Transform(
  //           transform: Matrix4.translationValues(
  //               0.0, 50 * (1.0 - animation!.value), 0.0),
  //           child: Padding(
  //             padding: const EdgeInsets.only(
  //                 left: 24, right: 24, top: 8, bottom: 16),
  //             child: InkWell(
  //               splashColor: Colors.transparent,
  //               onTap: callback,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  //                   boxShadow: <BoxShadow>[
  //                     BoxShadow(
  //                       color: Colors.grey.withOpacity(0.6),
  //                       offset: const Offset(4, 4),
  //                       blurRadius: 16,
  //                     ),
  //                   ],
  //                 ),
  //                 child: ClipRRect(
  //                   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  //                   child: Stack(
  //                     children: <Widget>[
  //                       Column(
  //                         children: <Widget>[
  //                           AspectRatio(
  //                             aspectRatio: 2,
  //                             child: Image.asset(
  //                               hotelData!.imagePath,
  //                               fit: BoxFit.cover,
  //                             ),
  //                           ),
  //                           Container(
  //                             color: HotelAppTheme.buildLightTheme()
  //                                 .backgroundColor,
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: <Widget>[
  //                                 Expanded(
  //                                   child: Container(
  //                                     child: Padding(
  //                                       padding: const EdgeInsets.only(
  //                                           left: 16, top: 8, bottom: 8),
  //                                       child: Column(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.center,
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.start,
  //                                         children: <Widget>[
  //                                           Text(
  //                                             hotelData!.titleTxt,
  //                                             textAlign: TextAlign.left,
  //                                             style: TextStyle(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 22,
  //                                             ),
  //                                           ),
  //                                           Row(
  //                                             crossAxisAlignment:
  //                                                 CrossAxisAlignment.center,
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment.start,
  //                                             children: <Widget>[
  //                                               Text(
  //                                                 hotelData!.subTxt,
  //                                                 style: TextStyle(
  //                                                     fontSize: 14,
  //                                                     color: Colors.grey
  //                                                         .withOpacity(0.8)),
  //                                               ),
  //                                               const SizedBox(
  //                                                 width: 4,
  //                                               ),
  //                                               Icon(
  //                                                 FontAwesomeIcons.mapMarkerAlt,
  //                                                 size: 12,
  //                                                 color: HotelAppTheme
  //                                                         .buildLightTheme()
  //                                                     .primaryColor,
  //                                               ),
  //                                               Expanded(
  //                                                 child: Text(
  //                                                   '${hotelData!.dist.toStringAsFixed(1)} km to city',
  //                                                   overflow:
  //                                                       TextOverflow.ellipsis,
  //                                                   style: TextStyle(
  //                                                       fontSize: 14,
  //                                                       color: Colors.grey
  //                                                           .withOpacity(0.8)),
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                           Padding(
  //                                             padding:
  //                                                 const EdgeInsets.only(top: 4),
  //                                             child: Row(
  //                                               children: <Widget>[
  //                                                 RatingBar(
  //                                                   initialRating:
  //                                                       hotelData!.rating,
  //                                                   direction: Axis.horizontal,
  //                                                   allowHalfRating: true,
  //                                                   itemCount: 5,
  //                                                   itemSize: 24,
  //                                                   ratingWidget: RatingWidget(
  //                                                     full: Icon(
  //                                                       Icons.star_rate_rounded,
  //                                                       color: HotelAppTheme
  //                                                               .buildLightTheme()
  //                                                           .primaryColor,
  //                                                     ),
  //                                                     half: Icon(
  //                                                       Icons.star_half_rounded,
  //                                                       color: HotelAppTheme
  //                                                               .buildLightTheme()
  //                                                           .primaryColor,
  //                                                     ),
  //                                                     empty: Icon(
  //                                                       Icons
  //                                                           .star_border_rounded,
  //                                                       color: HotelAppTheme
  //                                                               .buildLightTheme()
  //                                                           .primaryColor,
  //                                                     ),
  //                                                   ),
  //                                                   itemPadding:
  //                                                       EdgeInsets.zero,
  //                                                   onRatingUpdate: (rating) {
  //                                                     print(rating);
  //                                                   },
  //                                                 ),
  //                                                 Text(
  //                                                   ' ${hotelData!.reviews} Reviews',
  //                                                   style: TextStyle(
  //                                                       fontSize: 14,
  //                                                       color: Colors.grey
  //                                                           .withOpacity(0.8)),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(
  //                                       right: 16, top: 8),
  //                                   child: Column(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.center,
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.end,
  //                                     children: <Widget>[
  //                                       Text(
  //                                         '\$${hotelData!.perNight}',
  //                                         textAlign: TextAlign.left,
  //                                         style: TextStyle(
  //                                           fontWeight: FontWeight.w600,
  //                                           fontSize: 22,
  //                                         ),
  //                                       ),
  //                                       Text(
  //                                         '/per night',
  //                                         style: TextStyle(
  //                                             fontSize: 14,
  //                                             color:
  //                                                 Colors.grey.withOpacity(0.8)),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Positioned(
  //                         top: 8,
  //                         right: 8,
  //                         child: Material(
  //                           color: Colors.transparent,
  //                           child: InkWell(
  //                             borderRadius: const BorderRadius.all(
  //                               Radius.circular(32.0),
  //                             ),
  //                             onTap: () {},
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               child: Icon(
  //                                 Icons.favorite_border,
  //                                 color: HotelAppTheme.buildLightTheme()
  //                                     .primaryColor,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
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
