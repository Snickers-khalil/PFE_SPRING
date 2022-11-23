
import 'dart:convert';
AnnonceMo annonceModelJson(String str) =>
AnnonceMo.fromJson(json.decode(str));

String annonceModelToJson(AnnonceMo data) => json.encode(data.toJson());

class AnnonceMo {
  int? id;
  String? titre,description,categorie,adresse,phone,imageUrl,date_ajout;
  double? prix;
  AnnonceMo( {this.id, this.titre, this.description,
           this.date_ajout,this.adresse,
           this.phone,this.prix, this.imageUrl, 
           this.categorie}
          );
//  AnnonceMo.fromJson(Map<String, dynamic> json){
//     this.id=json["id"] ;
//     this.titre= json["titre"] ;
//     this.description= json["description"] ;
//     this.categorie= json["categorie"] ;
//     this.date_ajout= json["date_ajout"] ;
//     this.adresse= json["adresse"] ;
//     this.phone= json["phone"] ;
//     this.prix= json["prix"] ;
//     this.imageUrl= json["imageUrl"] ;
//  }

 factory AnnonceMo.fromJson(Map<String, dynamic> json) => AnnonceMo(
      titre: json["titre"],
     description: json["description"],
      categorie: json["categorie"],
      adresse: json["adresse"],
      date_ajout: json["date_ajout"],
      imageUrl: json["imageUrl"],
      phone: json["phone"],
      prix: json["prix"],
      id: json["id"]
      );
      
Map<String, dynamic> toJson() => {
        "titre": titre,
        "description": description,
        "categorie": categorie,
        "adresse": adresse,
        "phone": phone,
        "prix": prix,
        "date_ajout": date_ajout,
        "imageUrl": imageUrl,
        'id': id,
      };


}


    // roles: json["roles"] == null ? null : Role.fromJson(json["roles"]),



  // factory Annonce.fromJson(Map<String, dynamic> json) => Annonce(
  //   id: json["id"] == null ? null : json["id"],
  //   titre: json["titre"] == null ? null : json["titre"],
  //   description: json["description"] == null ? null : json["firstname"],
  //   categorie: json["categorie"] == null ? null : json["categorie"],
  //   date_ajout: json["date_ajout"] == null ? null : json["date_ajout"],
  //   adresse: json["adresse"] == null ? null : json["adresse"],
  //   phone: json["phone"] == null ? null : json["phone"],
  //    prix: json["prix"] == null ? null : json["prix"],
  //   // roles: json["roles"] == null ? null : Role.fromJson(json["roles"]),
  // );


  // Map<String, dynamic> toJson() => {
  //   "id": id == null ? null : id,
  //   "username": username == null ? null : username,
  //   "email": email == null ? null : email,
  //   // "role": role == null ? null : role,
  //   // "role": role == null ? null : role!.toJson(),
  // };
//}

