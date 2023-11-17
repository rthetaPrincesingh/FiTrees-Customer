import 'package:fitrees_customer/controllers/apiController/userAuthentication.dart';
import 'package:fitrees_customer/models/apisList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> raiseEnquiry(requestBody) async {
  final Uri url = Uri.parse(raiseEnquiryApi);
  final Map<String, String> headers = {
    "accept": "application/json",
    "authorization": tokens[0],
    "Content-Type": "application/json",
  };

  print(requestBody);
  final String jsonBody = json.encode(requestBody);
  final http.Response response = await http.post(
    url,
    headers: headers,
    body: jsonBody,
  );
  checkStatus(response);

  print(response.body);
  if (response.statusCode == 201) {
    return true;
  }

  return false;
}