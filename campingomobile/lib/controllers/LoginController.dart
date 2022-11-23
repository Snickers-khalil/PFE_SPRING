import 'package:Campingo/Bindings/Bindings.dart';
import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/data/LocalStorage.dart';
import 'package:Campingo/models/UserModel.dart';
import 'package:Campingo/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  String username = "", password = "";
  RxBool userLogged = false.obs;
  LocalStorage storage = LocalStorage();
  User? _user;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  var isPreesed = false.obs;
  final appState = Rx<AppState>(AppState.IDLE);

  User? get user => _user;

  final AuthService authService = AuthService();

  signInUser() async {
    Logger().d("signInUser called");

    appState.value = AppState.LOADING;
    isPreesed.value = true;
    //_user = await authService.userLogin(username, password);
    await Future.delayed(Duration(seconds: 3));
    if (_user != null) {
      Get.offAndToNamed(Routers.initialRoute);
    } else {
      Get.snackbar(
        'Somthing Wrong',
        'Make Sure Login Info Is Correct',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    appState.value = AppState.DONE;
    isPreesed.value = false;
    update();
  }

  Future signOutUser() async {
    appState.value = AppState.LOADING;
  
    await authService.signOutUser();
    await Future.delayed(Duration(seconds: 3));
    // Get.offAndToNamed(Routers.initialRoute);
    Logger().d("signOutUser called");
    update();
    // Get.offAndToNamed(Routers.initialRoute);
    appState.value = AppState.DONE;
  }

  Future<User?> getLoggedInUserObject() async {
    Map<String, dynamic> res = await authService.getMe();
    User? user_FromJson = User.fromJson(res);
    _user = user_FromJson;
    Logger().d("user_FromJson : ${_user!.username}");
    // } else {
    //   Logger().d("user is null");
    //   return null;
    // }
    // } catch (e) {
    //   Logger().d(e.toString());
    // }
    update();
    return _user;
  }

  @override
  void onInit() async {
    super.onInit();
    Logger().d("onInit Login Controlelr called : ");
    ever(isPreesed, (_) {
      Logger().d("isPreesed called");
      return !isPreesed.value;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  get onDelete => super.onDelete;
}

// user = await Get.find<LoginController>().getLoggedInUserObject();
//     var userId = user!.id!;
//     Logger().d(userId.toString());
