

import 'package:Campingo/data/LocalStorage.dart';
import 'package:Campingo/models/UserModel.dart';
import 'package:Campingo/services/AuthService.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ProfilController extends GetxController{
  LocalStorage storage = LocalStorage();

  Future<User> getLoggedInUserObject() async {
    Map<String, dynamic> res = await AuthService().getMe();
    User? user = User.fromJson(res);
   // _user = user_FromJson;
    Logger().d("user_FromJson : ${user.username}");
    return user;
  }
}