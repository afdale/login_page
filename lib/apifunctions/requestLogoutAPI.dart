import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:login_page/apifunctions/getToken.dart';
import 'package:login_page/apifunctions/requestLoginAPI.dart';
import 'package:login_page/apifunctions/requestLogoutAPI.dart';
import 'package:login_page/apifunctions/saveCurrentLogin.dart';
import 'package:login_page/apifunctions/saveLogout.dart';

Future<Map<String,dynamic>>  requestLogoutAPI() async {
  final url = "-t";

  final String token = await getToken();

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'token': token,
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseJson = json.decode(response.body);

    //if logout success or token already xpired somehow
  if (response.statusCode == 200 || !responseJson['auth']) {
    saveLogout();
    return {'status':true};
  } else {
    return {'status':false, 'msg':responseJson['msg']};
  }
}
