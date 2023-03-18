import 'dart:convert';

import 'package:cric_api/model/player_info.dart';
import 'package:cric_api/pages/utils/appstrings.dart';
import 'package:http/http.dart' as http;

class Playerss {
  static List<Data>? dataa;
  Future<List<Data>?> getPlayers(String id) async {
    String url =
        'https://api.cricapi.com/v1/match_squad?apikey=${AppStrings.apikey}&id=$id';

    var res = await http.get(Uri.parse(url));
    var playerdata = json.decode(res.body);

    if (res.statusCode == 200) {
      dataa = PlayerInfo.fromJson(playerdata).data;
      return dataa;
    } else {
      return dataa;
    }
  }
}
