 import 'dart:convert';
import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/controllers/LoginController.dart';
import 'package:Campingo/data/LocalStorage.dart';
import 'package:Campingo/models/AnnonceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart'as http;
  var context;
String? titre,description,adresse,categorie,phone,prix;
LocalStorage storage = LocalStorage();
  Addannonce(GlobalKey<FormState> formkey) async {
      var user = await Get.put(LoginController()).getLoggedInUserObject();
         var userId = user!.id!;
          //Logger().d(token);
         Logger().d(userId.toString());

    var url = '$BaseUrl$AddAnn$userId';
     Logger().d(formkey);
    var body = jsonEncode({
      "titre": titre,
      "description": description,
      "adresse": adresse,
      "prix": prix,
      "categorie": categorie,
      "phone": phone,
      //"utilisateur_id": city,
    });
    var headers = {'Content-Type': 'application/json'};
    var response =
        await http.post(Uri.parse(url),
         headers: headers,
          body: body);
      //  final data = jsonDecode(response.body);
    if (response.statusCode == 200) {

      Logger().d(titre);
      Logger().d(" add with succ");
    //    ScaffoldMessenger.of(context)
    //    .showSnackBar(SnackBar(content: Text("Add avec succe")));
    //    Navigator.push(context,
    //      MaterialPageRoute(builder:(context)=>HomeView()));
    // ScaffoldMessenger.of(context)
    //  .showSnackBar(SnackBar(content:  Text("Add ${titre} with succ")));
    }else{
    //    ScaffoldMessenger.of(context)
    // .showSnackBar(SnackBar(content: Text("erreur d'ajouter ")));
    }
  }
// GetAll,FetchData
//   Future<List<Annonce>> getAnnonces() async {
//     var data = await http.get(Uri.parse('$BaseUrl$Getann'));
//     var jsonData = json.decode(data.body);
//     List<Annonce> annonce = [];
//     for (var a in jsonData) {
//       Annonce Annonces = new Annonce();
//       Annonces.id = a["id"];
//       Annonces.titre = a["titre"];
//       Annonces.description = a["description"];
//        annonce.add(Annonces);
//     }
//     return annonce;
//   }

class FetchApi{
  Future<List<AnnonceMo>?> getAnnonces() async{
    http.Response response=await http.get(Uri.parse('$BaseUrl$GetAnn'));
    Logger().d(response.statusCode);
    Logger().d('called methode');
    if(response.statusCode==200){
      var body=jsonDecode(response.body);
      List<AnnonceMo> annonces=[] ;
       for (var a  in body) {
         annonces.add(AnnonceMo.fromJson(a));
        Logger().d(annonces);
       }
       Logger().d(annonces);
       return annonces;
    }
    return null;
  }
}