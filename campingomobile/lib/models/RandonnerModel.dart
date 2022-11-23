import 'dart:convert';



RandonnerModel employeeModelJson(String str) => RandonnerModel.fromJson(json.decode(str));

//imageUrl imagesFromAd(String str) => imageUrl.fromJson(json.decode(str));

String employeeModelToJson(RandonnerModel data) => json.encode(data.toJson());

class RandonnerModel {
  int? id;
  String? adress;
  String? programme;
  String? cercuit;
  String? difficult;
  String? date;
  String? imageUrl;


  RandonnerModel({this.id, this.adress, this.programme, this.cercuit,
      this.difficult, this.date, this.imageUrl});

  factory RandonnerModel.fromJson(Map<String, dynamic> json) => RandonnerModel(
      adress: json["adress"],
      programme: json["programme"],
      cercuit: json["cercuit"],
      difficult: json["difficult"],
      date: json["date"],
      imageUrl: json["imageUrl"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "adress": adress,
        "programme": programme,
        "cercuit": cercuit,
        "difficult": difficult,
        "date": date,
        "imageUrl": imageUrl,
        'id': id,
      };
  String? get adresse => adress;

  String? get programmee => programme;
  String? get cercuite => cercuit;
  String? get difficulte => difficult;
  String? get datee => date;
  String? get imageUrlee => imageUrl;
  int? get ide => id;
}