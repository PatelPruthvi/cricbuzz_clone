class PlayerInfo {
  String? apikey;
  List<Data>? data;
  String? status;
  Info? info;

  PlayerInfo({this.apikey, this.data, this.status, this.info});

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apikey'] = apikey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}

class Data {
  String? teamName;
  List<Players>? players;

  Data({this.teamName, this.players});

  Data.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teamName'] = teamName;
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  String? id;
  String? name;
  String? role;
  String? battingStyle;
  String? bowlingStyle;
  String? country;
  String? playerImg;

  Players(
      {this.id,
      this.name,
      this.role,
      this.battingStyle,
      this.bowlingStyle,
      this.country,
      this.playerImg});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    battingStyle = json['battingStyle'];
    bowlingStyle = json['bowlingStyle'];
    country = json['country'];
    playerImg = json['playerImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['battingStyle'] = battingStyle;
    data['bowlingStyle'] = bowlingStyle;
    data['country'] = country;
    data['playerImg'] = playerImg;
    return data;
  }
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  double? queryTime;
  int? s;

  Info(
      {this.hitsToday,
      this.hitsUsed,
      this.hitsLimit,
      this.credits,
      this.server,
      this.queryTime,
      this.s});

  Info.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    queryTime = json['queryTime'];
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hitsToday'] = hitsToday;
    data['hitsUsed'] = hitsUsed;
    data['hitsLimit'] = hitsLimit;
    data['credits'] = credits;
    data['server'] = server;
    data['queryTime'] = queryTime;
    data['s'] = s;
    return data;
  }
}
