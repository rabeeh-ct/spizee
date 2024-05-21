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

  // dynamic postFile(String path,
  //     {required Map<String, dynamic> params, required String imageField}) async {
  //   final token = getToken(params);
  //   params.remove("token");
  //   Map<String, String> headers = {
  //     "Accept": "application/json",
  //     "Authorization": "Token $token"
  //   };
  //   String? filePath = params[imageField];
  //
  //   var request = MultipartRequest("post", getPath(path));
  //
  //   consoleLog(getPath(path));
  //   consoleLog(jsonEncode(params));
  //
  //   params.forEach((key, value) {
  //     if (key != imageField) {
  //       if (value != null) {
  //         request.fields[key] = value;
  //       }
  //     }
  //   });
  //   filePath != null
  //       ? request.files.add(
  //           await MultipartFile.fromPath(imageField, filePath),
  //         )
  //       : null;
  //
  //   consoleLog("working>>>>>>>>>>>>>>>>>>> ${request.fields},  ${request.files}");
  //   // request.files.add(await MultipartFile.fromPath("image", filePath));
  //   request.headers.addAll(headers);
  //   final response = await request.send();
  //   consoleLog("statusCode >>>>>>>>>>>>>>>>>>> ${response.statusCode}");
  //   consoleLog("statusCode >>>>>>>>>>>>>>>>>>> ${response.reasonPhrase}");
  //   final responseStr = await response.stream.bytesToString();
  //   consoleLog("...${json.decode(responseStr)}");
  //   return json.decode(responseStr);
  // }
}

Uri getPath(String path, {Map<String, dynamic>? queryParameters}) {
  return Uri.https(ApiConstants.baseUrls,path,queryParameters);
}
