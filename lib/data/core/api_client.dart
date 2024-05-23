import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/debug_utils.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client = Client();

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));

    final response = await _client.post(getPath(path),
        body: jsonEncode(params), headers: {'Content-Type': 'application/json'});
    consoleLog(response.body);
    return json.decode(utf8.decode(response.bodyBytes));
  }

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {

    consoleLog("data");
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));

    final response = await _client.get(getPath(path),
        headers: {'Content-Type': 'application/json'});
    consoleLog(response.body);
    return json.decode(utf8.decode(response.bodyBytes));
  }

  String getToken(Map<dynamic, dynamic> params) {
    final String token = params["token"];
    return token;
  }
}

Uri getPath(String path, {Map<String, dynamic>? queryParameters}) {
  return Uri.https(ApiConstants.baseUrls,path,queryParameters);
}
