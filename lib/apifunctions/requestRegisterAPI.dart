import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> requestRegisterAPI(String fullname, String email, String password) async {
  final url = "-";

  Map<String, String> body = {
    'name': fullname,
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

  if (response.statusCode == 201) {

    return {'status':true};

  } else {

    return {'status':false, 'msg':responseJson['msg']};
  }
}

