import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:report_manager/config.dart';
import 'package:report_manager/models/login_request_model.dart';
import 'package:report_manager/models/login_response_model.dart';
import 'package:report_manager/models/report_response_model.dart';
import 'package:report_manager/models/users_response_model.dart';
import 'package:report_manager/services/shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.loginAPI);
    var response = await client.post(url, headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    }

    return false;
  }

  static Future<String> users() async {
    var loginDetails = await SharedService.loginDetails();
    var authToken = loginDetails?.message.authToken;

    if (authToken != null) {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'X-DCRT-AUTH': authToken,
      };

      var url = Uri.https(Config.apiUrl, Config.usersAPI);
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        return response.body;
      }

      // TODO: Установить dio и отрефакторить под него
      if (response.statusCode == 420) {
        // TODO: Make interceptor

        return '';
      }
    }

    return '';
  }

  static Future<String> reports() async {
    var loginDetails = await SharedService.loginDetails();
    var authToken = loginDetails?.message.authToken;
    var usersBody = await users();

    if (authToken != null && usersBody != '') {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'X-DCRT-AUTH': authToken,
      };

      var usersJSON = jsonDecode(usersBody);
      var usersIds = usersJSON.map((user) => user.id);
      var dateString = dateFormat.format(DateTime.now());

      var url = Uri.https(
        Config.apiUrl,
        Config.reportsAPI,
        {
          'user_ids': usersIds,
          'date_from': dateString,
          'date_to': dateString,
        }
      );
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        return response.body;
      }

      // TODO: Установить dio и отрефакторить под него
      if (response.statusCode == 420) {
        // TODO: Make interceptor

        return '';
      }
    }

    return '';
  }
}