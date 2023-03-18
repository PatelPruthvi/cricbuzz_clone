// ignore_for_file: file_names

import 'package:cric_api/functions/internet.dart';
import 'package:cric_api/model/current.dart';
import 'package:cric_api/pages/utils/appstrings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MatchRes {
  String apikey = '7277c3e5-6074-43ee-8de8-ffa68cc8b649';
  static String abc =
      'https://api.cricapi.com/v1/currentMatches?apikey=${AppStrings.apikey}&offset=0';
  static List<Data>? data1;
  Future<List<Data>?> getData() async {
    bool inter = false;

    inter = await internet.checkInternet();

    if (inter == true) {
      var resp = await http.get(Uri.parse(abc));
      var mapd = json.decode(resp.body);

      if (resp.statusCode == 200) {
        data1 = CurrentMatch.fromJson(mapd).data;
        return data1;
      } else {
        return data1;
      }
    } else {
      Fluttertoast.showToast(
          msg: 'You are currently offline ',
          textColor: Colors.blueGrey,
          backgroundColor: Colors.white);
      return [];
    }
  }
}
