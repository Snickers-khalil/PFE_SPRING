import 'dart:convert';

import 'package:Campingo/constants/constants.dart';
import 'package:http/http.dart'as http;
addrandonner (
      String adress,
      String programme,
      String cercuit,
      String difficult,
      String date,
      String imageUrl,
      // String imageUrl
      ) async {
    var response = await http.post(Uri.parse('$BaseUrl$AddRand/$id'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "adress": adress,
          "programme": programme,
          "cercuit": cercuit,
          "difficult": difficult,
          "date": date,
          // "image": imageUrl,
        }));

    String responseString = response.body;
  }