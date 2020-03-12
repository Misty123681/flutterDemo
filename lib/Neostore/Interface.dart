import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'RegResponse.dart';
import 'NeoLoginView.dart';





class Interface {

//  http.post(
//  endpoint,
//  body: {"email": username, "password": password}).then((onValue){
//  print(onValue);
//  });


  static final endpoint = 'http://staging.php-dev.in:8844/trainingapp/api/users/login';
  String message;
  
   Future<RegistrationInfo> fetchLoginCredentials(
      String username, String password) async {
    final response = await http.post(
        endpoint,
        body: {"email": username, "password": password});

    print(response.body);
    if (response.statusCode == 200) {
     // NeostoreView().delegate.showalert("hdjdhdjk");  return RegistrationInfo.fromJson(json.decode(response.body));


    } else {
      Map result = json.decode(response.body);
      print(result["message"]);
      return null;
    }
  }

}

