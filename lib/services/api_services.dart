import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:whiterabitmachinetest/error/app_error.dart';

class ApiService {

  Future<ParsedResponse> get(String url, {required Map headers, required Map params, bool needAuthentication = false}) async {
    // var url;
    //url = "https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas";
    return http.get(Uri.parse(url),).timeout(
      Duration(seconds: 30),
      onTimeout: () {
        throw AppError.noInternet;

      },
    ).then((http.Response response) {
      final String res = response.body;
      final int code = response.statusCode;
      debugPrint("Status code for " + url + "::: " + code.toString());
      debugPrint("Response ::: " + res);

      if (res == null || res.isEmpty) {
        throw AppError.serverError;
      } else {
        return ParsedResponse(code, res);
      }
    }).catchError((Object e) {
      throw AppError.noInternet;
    });
  }

}

class ParsedResponse {
  int code;
  String response;

  ParsedResponse(this.code, this.response);

  bool isOk() {
    return code == 200;
  }

  @override
  String toString() {
    return 'ParsedResponse{code : $code, response : " $response "}';
  }
}
