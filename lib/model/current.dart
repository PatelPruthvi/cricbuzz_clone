class CurrentMatch {
  String? apikey;
  List<Data>? data;
  String? status;
  Info? info;

  CurrentMatch({this.apikey, this.data, this.status, this.info});

  CurrentMatch.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  String? dateTimeGMT;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  List<Score>? score;
  String? seriesId;
  bool? fantasyEnabled;
  bool? hasSquad;

  Data(
      {this.id,
      this.name,
      this.matchType,
      this.status,
      this.venue,
      this.date,
      this.dateTimeGMT,
      this.teams,
      this.teamInfo,
      this.score,
      this.seriesId,
      this.fantasyEnabled,
      this.hasSquad});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    matchType = json['matchType'];
    status = json['status'];
    venue = json['venue'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    if (json['teams'] != null) teams = json['teams'].cast<String>();
    if (json['teamInfo'] != null) {
      teamInfo = <TeamInfo>[];
      json['teamInfo'].forEach((v) {
        teamInfo!.add(TeamInfo.fromJson(v));
      });
    }
    if (json['score'] != null) {
      score = <Score>[];
      json['score'].forEach((v) {
        score!.add(Score.fromJson(v));
      });
      if (json['score'].length == 1) {
        score!.add(Score(0, 0, 0.0, 'innings not started'));
      }
    }

    seriesId = json['series_id'];
    fantasyEnabled = json['fantasyEnabled'];
    hasSquad = json['hasSquad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['matchType'] = matchType;
    data['status'] = status;
    data['venue'] = venue;
    data['date'] = date;
    data['dateTimeGMT'] = dateTimeGMT;
    data['teams'] = teams;
    if (teamInfo != null) {
      data['teamInfo'] = teamInfo!.map((v) => v.toJson()).toList();
    }
    if (score != null) {
      data['score'] = score!.map((v) => v.toJson()).toList();
    }
    data['series_id'] = seriesId;
    data['fantasyEnabled'] = fantasyEnabled;
    data['hasSquad'] = hasSquad;
    return data;
  }
}

class TeamInfo {
  String? name;
  String? img;
  String? shortname;

  TeamInfo({this.name, this.img, this.shortname});

  TeamInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    shortname = json['shortname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['img'] = img;
    data['shortname'] = shortname;
    return data;
  }
}

class Score {
  int? r;
  int? w;
  num? o;
  String? inning;

  Score(int i, int j, double d, String s,
      {this.r, this.w, this.o, this.inning});

  Score.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    w = json['w'];
    o = json['o'];
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['r'] = r;
    data['w'] = w;
    data['o'] = o;
    data['inning'] = inning;
    return data;
  }
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  int? offsetRows;
  int? cache;
  int? totalRows;
  double? queryTime;
  int? s;

  Info(
      {this.hitsToday,
      this.hitsUsed,
      this.hitsLimit,
      this.credits,
      this.server,
      this.offsetRows,
      this.cache,
      this.totalRows,
      this.queryTime,
      this.s});

  Info.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    offsetRows = json['offsetRows'];
    cache = json['cache'];
    totalRows = json['totalRows'];
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
    data['offsetRows'] = offsetRows;
    data['cache'] = cache;
    data['totalRows'] = totalRows;
    data['queryTime'] = queryTime;
    data['s'] = s;
    return data;
  }
}
