import 'dart:convert';
import 'package:cric_api/model/singledata.dart';
import 'package:cric_api/pages/utils/appstrings.dart';
import 'package:http/http.dart' as http;

class DetailsRes {
  static Data? scorecard1;

  Future<Data?> getDaat(String uid) async {
    String uri =
        'https://api.cricapi.com/v1/match_scorecard?apikey=${AppStrings.apikey}&id=$uid';

    var respon = await http.get(Uri.parse(uri));
    var mapd = await json.decode(respon.body);

    if (respon.statusCode == 200) {
      scorecard1 = DetailView.fromJson(mapd).data;
      return scorecard1;
    } else {
      return scorecard1;
    }
  }
}
