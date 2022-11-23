import 'package:Campingo/data/LocalStorage.dart';
import 'package:flutter/material.dart';

LocalStorage storage = LocalStorage();

var a = storage.readToken();
var id = storage.readid();

//Logger().d(" Token From app : $a");
// const BaseUrl = "http://192.168.8.100:1111";
// const BaseUrl = "http://192.168.10.3:8080";
//const BaseUrl = "http://localhost:8080";


const BaseUrl = "http://192.168.217.254:8080";

const AuthUrlRegister = "/api/auth/register";
const AuthUrlLogin = "/api/auth/login";
const AddAnn = "/annonce/add/";
const GetAnn = "/annonce/all";
const GetRand="/rand/all";
const GetEvent="/event/all";
const AddRand="/rand/add";
const AddEvent = "/event/add";
//const AddRand = "/rand/add";

const Map<String, String> headersNoAuth = {
  'Content-Type': 'text/plain',
  "Accept": "application/json"
};

const kPrimaryColor = Color(0xFF0473C0);
const kPrimaryColorShadow = Color(0xFF7B94B1);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

// final fontStyle = GoogleFonts.almarai(
//   textStyle: TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.normal,
//     color: Colors.black87,
//     height: 1.5,
//   ),
// );

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular((15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

Decoration containerStyle = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  border: Border.all(color: kPrimaryColor, width: 1.0),
  boxShadow: [
    BoxShadow(
        color: kPrimaryColor.withOpacity(0.1),
        blurRadius: 1,
        offset: Offset(-10, 12)),
  ],
);

// InputDecoration textFieldDecorationCircle(
//     {String? hint, String? lable, Icon? icon, TextStyle? style}) {
//   style = fontStyle.copyWith(color: Colors.grey, fontSize: 14);
//   return InputDecoration(
//     // prefixIcon: icon,
// //      prefixIcon: icon,
// //     icon: icon,
//     suffixIcon: icon,
//     hintTextDirection: TextDirection.rtl,
//     floatingLabelBehavior: FloatingLabelBehavior.never,
//     contentPadding: EdgeInsets.all(10),
//     hintText: hint,
//     labelText: lable,
//     hintStyle: style,
//     labelStyle: style,
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.blue),
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//     ),
//     disabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey),
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey),
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.redAccent),
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//     ),
//   );
// }

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}

enum AppState { IDLE, LOADING, DONE, ERROR }

