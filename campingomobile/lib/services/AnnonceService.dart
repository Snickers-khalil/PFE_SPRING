import 'package:Campingo/constants/constants.dart';
import 'package:logger/logger.dart';

class AnnonceService{
 
 
 
  getLoggedUserId() async {
    var isUserLogged = await storage.readToken();
    var token;
    if (isUserLogged != 0) {
       token = isUserLogged;
       Logger().d(token);
    } else {
       Logger().d("getLoggedUserId : error in user token");
    }
    return token;
  }
}

 