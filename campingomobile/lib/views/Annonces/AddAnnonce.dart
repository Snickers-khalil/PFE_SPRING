

import 'package:Campingo/controllers/AnnonceController.dart';
import 'package:Campingo/views/Annonces/AnnonceView.dart';
import 'package:Campingo/views/FirstBoard/BottomNav.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
String? titre,description,adress,categorie,phone,prix;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    // DateTime? date_ajout;
  Future<void> AddAnnonce(BuildContext context) async {
    //  final ImagePicker _picker = ImagePicker();
    //  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //TextEditingController password = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
           content: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.adb),
                        hintText: 'Titre d annonce?',
                        labelText: 'Titre ',
                      ),
                      validator: (String? value){
                        Logger().d(value);
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Titre';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      titre = value;
                      Logger().d(titre);
                      Logger().d(value);
                    },
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.description),
                        hintText: 'Description',
                        labelText: 'Description ',
                      ),
                      validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Description';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      description = value ;
                      Logger().d(value);
                    },
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.category),
                        hintText: 'Cathegorie',
                        labelText: 'Cathegorie ',
                      ),
                      validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Cathegorie';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      categorie = value ;
                    },
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.money),
                      hintText: 'Prix',
                      labelText: 'Prix ',
                    ),
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Prix';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      prix = value;
                    },
                  )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      //controller: phone,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'What is Your Phone Number?',
                        labelText: 'Phone',
                      ),
                      onSaved: (String? value) {
                         phone = value ;
                      },
                       validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Your Phone Number';
                      }
                      return null;
                    },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                  //  controller: city,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: 'Where did you live ?',
                      labelText: 'Adresse',
                    ),
                    onSaved: (String? value) {
                      adresse = value ;
                      Logger().d(adresse);
                      Logger().d(value);
                    },
                  ),
                ),
              ],
            ),
          ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>(BottomNav())));
                   // Navigator.pop();
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('ADD'),
                 onPressed: ()  {
                   if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    Logger().d(_formkey);
                    Addannonce(_formkey);
                  }
                }
              ),
            ],
          );
        });
  }
