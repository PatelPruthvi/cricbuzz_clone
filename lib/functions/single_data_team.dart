import 'package:cric_api/model/singledata.dart';

class TeamName {
  getTeamName(Data? scorecard1, int i) {
    if (scorecard1!.score!.length == 2) {
      if (scorecard1.score![i].inning
          .toString()
          .contains(scorecard1.teamInfo![0].name.toString())) {
        return scorecard1.teamInfo![0].shortname.toString();
      } else {
        return scorecard1.teamInfo![1].shortname.toString();
      }
    } else if (scorecard1.score!.length == 1) {
      if (scorecard1.score![0].inning
          .toString()
          .contains(scorecard1.teamInfo![0].name.toString())) {
        return scorecard1.teamInfo![0].shortname.toString();
      } else {
        return scorecard1.teamInfo![1].shortname.toString();
      }
    }
  }

  gettestInn(String s) {
    if (s.contains('Inning 1')) {
      return s.replaceAll('Inning 1', '1st Inn');
    } else if (s.contains('Inning 2')) {
      return s.replaceAll('Inning 2', '2nd Inn');
    }
  }
}
