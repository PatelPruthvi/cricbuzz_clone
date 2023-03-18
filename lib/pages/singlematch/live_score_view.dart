// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cric_api/functions/detail_class.dart';
import 'package:cric_api/functions/single_data_team.dart';
import 'package:cric_api/model/singledata.dart';
import 'package:cric_api/pages/singlematch/battinglst.dart';

class LiveScore extends StatefulWidget {
  String id;
  LiveScore({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<LiveScore> createState() => _LiveScoreState();
}

class _LiveScoreState extends State<LiveScore> {
  Data? scorecard1;
  Batting? notoutBat;
  bool isLoaded = false;
  getSD() async {
    scorecard1 = await DetailsRes().getDaat(widget.id);

    if (mounted) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    getSD();

    super.initState();
  }

  getTeamName(Data? scorecard1) {
    if (scorecard1!.score!.length == 2) {
      if (scorecard1.score![0].inning
          .toString()
          .contains(scorecard1.teamInfo![0].name.toString())) {
        return scorecard1.teamInfo![1].shortname.toString();
      } else {
        return scorecard1.teamInfo![0].shortname.toString();
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

  String getPartnership() {
    int b = 0;
    int c = 0;
    for (int a = 0;
        a <
            scorecard1!
                .scorecard![scorecard1!.scorecard!.length - 1].batting!.length;
        a++) {
      if (scorecard1!.scorecard![scorecard1!.score!.length - 1].batting![a]
                  .dismissalText ==
              'not out' ||
          scorecard1!.scorecard![scorecard1!.score!.length - 1].batting![a]
                  .dismissalText ==
              'batting') {
        b = b +
            scorecard1!.scorecard![scorecard1!.score!.length - 1].batting![a].r!
                .toInt();
        c = c +
            scorecard1!.scorecard![scorecard1!.score!.length - 1].batting![a].b!
                .toInt();
      }
    }
    return b.toString() + ' ( ${c.toString()})';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // ignore: prefer_const_literals_to_create_immutables
        child: scorecard1 != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 0, right: 0, bottom: 16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '  ' + scorecard1!.status.toString(),
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                scorecard1!.matchType == 'test'
                                    ? '  ' +
                                        TeamName().gettestInn(scorecard1!
                                            .score![
                                                scorecard1!.score!.length - 1]
                                            .inning
                                            .toString())
                                    : ' ' + getTeamName(scorecard1),
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                            ]),
                        const SizedBox(height: 8),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  ' ' +
                                      scorecard1!
                                          .score![scorecard1!.score!.length - 1]
                                          .r
                                          .toString() +
                                      '-' +
                                      scorecard1!
                                          .score![scorecard1!.score!.length - 1]
                                          .w
                                          .toString(),
                                  style: const TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  scorecard1!
                                          .score![scorecard1!.score!.length - 1]
                                          .o
                                          .toString() +
                                      ' ov',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                        const SizedBox(height: 20),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(children: [
                                const Text(
                                  'CRR ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  scorecard1!
                                      .scorecard![
                                          scorecard1!.scorecard!.length - 1]
                                      .totals!
                                      .rR
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                              Row(children: [
                                const Text(
                                  'P\'SHIP ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  getPartnership(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                            ]),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: const Color.fromARGB(255, 190, 194, 185),
                          child: Row(children: [
                            const Expanded(
                                child: Text(
                              '  Batter',
                            )),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(width: 40, child: Text('R')),
                                  SizedBox(width: 40, child: Text('B')),
                                  SizedBox(width: 30, child: Text('4s')),
                                  SizedBox(width: 30, child: Text('6s')),
                                  SizedBox(
                                    width: 55,
                                    child: Text(' SR'),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: scorecard1!
                                .scorecard![scorecard1!.score!.length - 1]
                                .batting!
                                .length,
                            itemBuilder: (context, inde) {
                              // ignore: prefer_const_literals_to_create_immutables
                              int j = scorecard1!.score!.length - 1;
                              return scorecard1!.scorecard![j].batting![inde]
                                              .dismissalText ==
                                          'not out' ||
                                      scorecard1!.scorecard![j].batting![inde]
                                              .dismissalText ==
                                          'batting'
                                  ? ListViewScore(
                                      score: scorecard1!, i: j, inde: inde)
                                  : Container();
                            }),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: const Color.fromARGB(255, 190, 194, 185),
                          child: Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                '  Bowler',
                              )),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(width: 40, child: Text('O')),
                                    SizedBox(width: 30, child: Text('M')),
                                    SizedBox(width: 25, child: Text('R')),
                                    SizedBox(width: 20, child: Text('W')),
                                    SizedBox(
                                      width: 60,
                                      child: Text(' ER'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: scorecard1!
                                    .scorecard![scorecard1!.score!.length - 1]
                                    .bowling!
                                    .length,
                                itemBuilder: (context, index2) {
                                  int i = scorecard1!.score!.length - 1;

                                  return scorecard1!
                                          .scorecard![i].bowling![index2].o
                                          .toString()
                                          .contains('.')
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: BowlerItem(
                                              scorecrd: scorecard1!,
                                              a: i,
                                              b: index2))
                                      : Container();
                                }))
                      ]),
                ),
              )
            : Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 0, 180, 137),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: CircularProgressIndicator(
                      backgroundColor: Color.fromARGB(255, 0, 180, 137),
                      color: Colors.white,
                    ),
                  ),
                ),
              ));
  }
}

class ListViewScore extends StatefulWidget {
  Data score;
  int i;
  int inde;
  ListViewScore({
    Key? key,
    required this.score,
    required this.i,
    required this.inde,
  }) : super(key: key);

  @override
  State<ListViewScore> createState() => _ListViewScoreState();
}

class _ListViewScoreState extends State<ListViewScore> {
  @override
  void initState() {
    getDD(widget.score, widget.i, widget.inde);
    super.initState();
  }

  Data? scorecard1;
  late int i;
  late int inde;
  getDD(Data score, int ind, int j) {
    scorecard1 = score;
    i = ind;
    inde = j;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    scorecard1!.scorecard![i].batting![inde].batsman!.name
                        .toString(),
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        scorecard1!.scorecard![i].batting![inde].r.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        scorecard1!.scorecard![i].batting![inde].b.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      child: Text(
                          scorecard1!.scorecard![i].batting![inde].i4s
                              .toString(),
                          style: const TextStyle(fontSize: 16)),
                    ),
                    SizedBox(
                      width: 20,
                      child: Text(
                          scorecard1!.scorecard![i].batting![inde].i6s
                              .toString(),
                          style: const TextStyle(fontSize: 16)),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                          scorecard1!.scorecard![i].batting![inde].sr!
                              .toStringAsFixed(2),
                          style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              )
            ]),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5),
          child: Text(scorecard1!.scorecard![i].batting![inde].dismissalText
              .toString()),
        )
      ],
    );
  }
}
