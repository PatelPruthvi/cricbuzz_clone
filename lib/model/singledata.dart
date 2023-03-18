class DetailView {
  String? apikey;
  Data? data;
  String? status;
  Info? info;

  DetailView({this.apikey, this.data, this.status, this.info});

  DetailView.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apikey'] = apikey;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  List<dynamic>? teams;
  List<TeamInfo>? teamInfo;
  List<Score>? score;
  String? tossWinner;
  String? tossChoice;
  String? matchWinner;
  String? seriesId;
  List<Scorecard>? scorecard;

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
      this.tossWinner,
      this.tossChoice,
      this.matchWinner,
      this.seriesId,
      this.scorecard});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    matchType = json['matchType'];
    status = json['status'];
    venue = json['venue'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    teams = json['teams'];
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
    }
    tossWinner = json['tossWinner'];
    tossChoice = json['tossChoice'];
    matchWinner = json['matchWinner'];
    seriesId = json['series_id'];
    if (json['scorecard'] != null) {
      scorecard = <Scorecard>[];
      json['scorecard'].forEach((v) {
        scorecard!.add(Scorecard.fromJson(v));
      });
    }
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
    data['tossWinner'] = tossWinner;
    data['tossChoice'] = tossChoice;
    data['matchWinner'] = matchWinner;
    data['series_id'] = seriesId;
    if (scorecard != null) {
      data['scorecard'] = scorecard!.map((v) => v.toJson()).toList();
    }
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

  Score({this.r, this.w, this.o, this.inning});

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

class Scorecard {
  List<Batting>? batting;
  List<Bowling>? bowling;
  List<Catching>? catching;
  Extras? extras;
  Totals? totals;
  String? inning;

  Scorecard(
      {this.batting,
      this.bowling,
      this.catching,
      this.extras,
      this.totals,
      this.inning});

  Scorecard.fromJson(Map<String, dynamic> json) {
    if (json['batting'] != null) {
      batting = <Batting>[];
      json['batting'].forEach((v) {
        batting!.add(Batting.fromJson(v));
      });
    }
    if (json['bowling'] != null) {
      bowling = <Bowling>[];
      json['bowling'].forEach((v) {
        bowling!.add(Bowling.fromJson(v));
      });
    }
    if (json['catching'] != null) {
      catching = <Catching>[];
      json['catching'].forEach((v) {
        catching!.add(Catching.fromJson(v));
      });
    }
    extras = json['extras'] != null ? Extras.fromJson(json['extras']) : null;
    totals = json['totals'] != null ? Totals.fromJson(json['totals']) : null;
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (batting != null) {
      data['batting'] = batting!.map((v) => v.toJson()).toList();
    }
    if (bowling != null) {
      data['bowling'] = bowling!.map((v) => v.toJson()).toList();
    }
    if (catching != null) {
      data['catching'] = catching!.map((v) => v.toJson()).toList();
    }
    if (extras != null) {
      data['extras'] = extras!.toJson();
    }
    if (totals != null) {
      data['totals'] = totals!.toJson();
    }
    data['inning'] = inning;
    return data;
  }
}

class Batting {
  Batsman? batsman;
  String? dismissal;
  Batsman? bowler;
  Batsman? catcher;
  String? dismissalText;
  int? r;
  int? b;
  int? i4s;
  int? i6s;
  num? sr;

  Batting(
      {this.batsman,
      this.dismissal,
      this.bowler,
      this.catcher,
      this.dismissalText,
      this.r,
      this.b,
      this.i4s,
      this.i6s,
      this.sr});

  Batting.fromJson(Map<String, dynamic> json) {
    batsman =
        json['batsman'] != null ? Batsman.fromJson(json['batsman']) : null;
    dismissal = json['dismissal'];
    bowler = json['bowler'] != null ? Batsman.fromJson(json['bowler']) : null;
    catcher =
        json['catcher'] != null ? Batsman.fromJson(json['catcher']) : null;
    dismissalText = json['dismissal-text'];
    r = json['r'];
    b = json['b'];
    i4s = json['4s'];
    i6s = json['6s'];
    sr = json['sr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (batsman != null) {
      data['batsman'] = batsman!.toJson();
    }
    data['dismissal'] = dismissal;
    if (bowler != null) {
      data['bowler'] = bowler!.toJson();
    }
    if (catcher != null) {
      data['catcher'] = catcher!.toJson();
    }
    data['dismissal-text'] = dismissalText;
    data['r'] = r;
    data['b'] = b;
    data['4s'] = i4s;
    data['6s'] = i6s;
    data['sr'] = sr;
    return data;
  }
}

class Batsman {
  String? id;
  String? name;

  Batsman({this.id, this.name});

  Batsman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Bowling {
  Batsman? bowler;
  num? o;
  int? m;
  int? r;
  int? w;
  int? nb;
  int? wd;
  num? eco;

  Bowling(
      {this.bowler,
      this.o,
      this.m,
      this.r,
      this.w,
      this.nb,
      this.wd,
      this.eco});

  Bowling.fromJson(Map<String, dynamic> json) {
    bowler = json['bowler'] != null ? Batsman.fromJson(json['bowler']) : null;
    o = json['o'];
    m = json['m'];
    r = json['r'];
    w = json['w'];
    nb = json['nb'];
    wd = json['wd'];
    eco = json['eco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bowler != null) {
      data['bowler'] = bowler!.toJson();
    }
    data['o'] = o;
    data['m'] = m;
    data['r'] = r;
    data['w'] = w;
    data['nb'] = nb;
    data['wd'] = wd;
    data['eco'] = eco;
    return data;
  }
}

class Catching {
  int? stumped;
  int? runout;
  int? catch1;
  Batsman? catcher;

  Catching({this.stumped, this.runout, this.catch1, this.catcher});

  Catching.fromJson(Map<String, dynamic> json) {
    stumped = json['stumped'];
    runout = json['runout'];
    catch1 = json['catch'];
    catcher =
        json['catcher'] != null ? Batsman.fromJson(json['catcher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stumped'] = stumped;
    data['runout'] = runout;
    data['catch'] = catch1;
    if (catcher != null) {
      data['catcher'] = catcher!.toJson();
    }
    return data;
  }
}

class Extras {
  int? r;
  int? b;
  int? lb;
  int? w;
  int? nb;
  int? p;

  Extras({this.r, this.b, this.lb, this.w, this.nb, this.p});

  Extras.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    b = json['b'];
    lb = json['lb'];
    w = json['w'];
    nb = json['nb'];
    p = json['p'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['r'] = r;
    data['b'] = b;
    data['lb'] = lb;
    data['w'] = w;
    data['nb'] = nb;
    data['p'] = p;
    return data;
  }
}

class Totals {
  int? r;
  num? o;
  int? w;
  num? rR;

  Totals({this.r, this.o, this.w, this.rR});

  Totals.fromJson(Map<String, dynamic> json) {
    r = json['R'];
    o = json['O'];
    w = json['W'];
    rR = json['RR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['R'] = r;
    data['O'] = o;
    data['W'] = w;
    data['RR'] = rR;
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
