import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:login_page/apifunctions/saveCurrentLogin.dart';
import 'dart:convert';
import 'package:login_page/json/user.dart';

Future<Map<String,dynamic>> requestLoginAPI(String email, String password) async {
  final url = "-";

  Map<String, String> body = {
    'email': email,
    'password': password,
  };

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  final responseJson = json.decode(response.body);

  if (response.statusCode == 200) {
    User user = new User.fromJson(responseJson['userData']);
    saveCurrentLogin(user, responseJson['token']);

    return {'status':true};
  } else {
    //showDialogSingleButton(context, "Unable to Login", responseJson['msg'], "OK");
    //showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' /
    // 'Password' combination. Please try again or contact your support representative.", "OK");
    return {'status':false, 'msg':responseJson['msg']};
  }
}