import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';
import 'package:present_unit_flutter/helpers/extension/string_print.dart';
import 'package:present_unit_flutter/model/error_response/error_response.dart';

import 'api_paths.dart';

class ApiMethods {
  static Future<bool> checkInternetConnectivity() async {
    List<ConnectivityResult> connectivityList = await Connectivity().checkConnectivity();
    return connectivityList.isNotEmpty &&
        connectivityList.any(
          (element) =>
              element == ConnectivityResult.mobile &&
              element == ConnectivityResult.wifi &&
              element == ConnectivityResult.ethernet,
        );
  }

  /// Get Method
  static Future<Either<ErrorResponseModel, T>> getMethod<T>(
    String path, {
    required T Function(Map<String, dynamic> json) fromJson,
    String? extraQuery,
    String? title,
  }) async {
    if (await checkInternetConnectivity()) {
      return Either.tryCatch(
        (err) {
          return ErrorResponseModel(statusCode: 900, message: ErrorModel(message: "No internet connection"));
        },
        () {
          return fromJson(jsonDecode(""));
        },
      );
    }
    final String entirePath = ApiPaths.url + path + (extraQuery != null && extraQuery.isNotEmpty ? extraQuery : "");
    // debugLog("Data of $entirePath");
    var response = await http.get(Uri.parse(entirePath), headers: {'Content-Type': 'application/json'});
    await Future.delayed(Duration(milliseconds: 250));

    Map<String, dynamic>? listToJson;
    if ((response.statusCode == 200 || response.statusCode == 201) && response.body.isNotEmpty) {
      var data = jsonDecode(response.body);

      if (title != null && title.isNotEmpty && data != null) {
        listToJson = {title: data};
      }
      "${listToJson ?? response.body}".logOnString("Data of $entirePath => ");
    }

    return Either.cond(
      response.statusCode == 200 || response.statusCode == 201,
      ErrorResponseModel(
        statusCode: response.statusCode,
        message: ErrorModel(
          message: response.statusCode == 200 || response.statusCode == 201
              ? response.body
              : jsonDecode(response.body)["message"],
        ),
      ),
      fromJson(listToJson ?? jsonDecode(response.body)),
    );
  }

  /// Post Method
  static Future<Either<ErrorResponseModel, T>> postMethod<T>(
    String path, {
    required T Function(Map<String, dynamic> json) fromJson,
    required Map<String, dynamic> requestBody,
    String? extraQuery,
    String? title,
  }) async {
    if (await checkInternetConnectivity()) {
      return Either.tryCatch(
        (err) {
          return ErrorResponseModel(statusCode: 900, message: ErrorModel(message: "No internet connection"));
        },
        () {
          return fromJson(jsonDecode(""));
        },
      );
    }

    final String entirePath = ApiPaths.url + path + (extraQuery != null && extraQuery.isNotEmpty ? extraQuery : "");
    jsonEncode(requestBody).logOnString("$entirePath jsonEncode(requestBody) => ");
    var response = await http.post(
      Uri.parse(entirePath),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
    await Future.delayed(Duration(milliseconds: 250));

    Map<String, dynamic>? listToJson;
    if (response.body.isNotEmpty) {
      response.body.toString().logOnString("Data of ${response.statusCode} $entirePath");
      var data = jsonDecode(response.body);
      if (data != null && data is List && title != null && title.isNotEmpty) {
        listToJson = {title: data};
      }
    }

    return Either.cond<ErrorResponseModel, T>(
      response.statusCode == 200 || response.statusCode == 201,
      ErrorResponseModel(
        statusCode: response.statusCode,
        message: ErrorModel(
          message: response.statusCode == 200 || response.statusCode == 201
              ? response.body
              : jsonDecode(response.body)["message"],
        ),
      ),
      fromJson(listToJson ?? jsonDecode(response.body)),
    );
  }
}
