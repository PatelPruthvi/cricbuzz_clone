// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:cric_api/model/response.dart';
import 'package:cric_api/pages/utils/appstrings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  static const String url =
      'https://api.cricapi.com/v1/series?apikey=${AppStrings.apikey}&offset=0';
  static List<Data>? data;
  Future<List<Data>?> getData() async {
    try {
      var response = await http.get(Uri.parse(url));
      var dat = json.decode(response.body);

      if (response.statusCode == 200) {
        data = UserResponse.fromJson(dat).data;
        return data;
      } else {
        return <Data>[];
      }
    } catch (e) {
      return <Data>[];
    }
  }

  Future<String?> getStatus() async {
    try {
      var response = await http.get(Uri.parse(url));
      var stat = json.decode(response.body);

      if (response.statusCode == 200) {
        String? s = UserResponse.fromJson(stat).status;
        return s;
      } else {
        return '';
      }
    } catch (e) {
      return ' ';
    }
  }
}
