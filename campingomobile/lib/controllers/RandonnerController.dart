import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/models/RandonnerModel.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

  Future<List<RandonnerModel>> GetallRandonner() async {
    var data = await http.get(Uri.parse('$BaseUrl$GetRand'));
    var jsonData = json.decode(data.body);

    List<RandonnerModel> randonner = [];
    for (var e in jsonData) {
      RandonnerModel Randonners = new RandonnerModel();
      Randonners.id = e["id"];
      Randonners.adress = e["adress"];
      Randonners.programme = e["programme"];
      Randonners.difficult = e["difficult"];
      Randonners.cercuit = e["cercuit"];
      Randonners.date = e["date"];
      Randonners.imageUrl = e["imageUrl"];
      randonner.add(Randonners);
    }
    return randonner;
  }
