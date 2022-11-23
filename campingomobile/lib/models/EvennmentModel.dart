import 'dart:convert';

EvennementModel EventModelJson(String str) =>
EvennementModel.fromJson(json.decode(str));

String EventModelToJson(EvennementModel data) => json.encode(data.toJson());

class EvennementModel {
  int? id;
  String? title;
  String? description;
  String? debut_event;
  String? fin_event;
  String? imageUrl;


  EvennementModel({this.id, this.title, this.description, this.debut_event,
      this.fin_event,this.imageUrl});

  factory EvennementModel.fromJson(Map<String, dynamic> json) => EvennementModel(
      title: json["title"],
      description: json["description"],
      debut_event: json["debut_event"],
      fin_event: json["fin_event"],
      imageUrl: json["imageUrl"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "debut_event": debut_event,
        "fin_event": fin_event,
        "imageUrl": imageUrl,
        'id': id,
      };

  String? get titlee => title;
  String? get descriptione => description;
  String? get debut_evente => debut_event;
  String? get fin_evente => fin_event;
  String? get imageUrlee => imageUrl;
  int? get ide => id;
}