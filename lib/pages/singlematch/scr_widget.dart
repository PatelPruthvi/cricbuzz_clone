// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, must_be_immutable
// ignore_for_file: prefer_const_constructors

import 'package:cric_api/functions/detail_class.dart';
import 'package:cric_api/functions/single_data_team.dart';
import 'package:cric_api/model/singledata.dart';
import 'package:cric_api/pages/singlematch/battinglst.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class MyHomePage extends StatefulWidget {
  String id;
  MyHomePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> ontap = [false, false, false, false];
  Data? scorecard1;
  Batting? notoutBat;
  bool isLoaded = false;

  getSD() async {
    scorecard1 = await DetailsRes().getDaat(widget.id);
    notoutBat = scorecard1!.scorecard![0].batting![0];
    if (mounted) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    getSD();
    getID(widget.id);
    super.initState();
  }

  String? abid;
  getID(String id) {
    abid = id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: scorecard1 != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 8),
                      child: Text(scorecard1!.status.toString(),
                          style: scorecard1!.matchWinner != null
                              ? TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)
                              : TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: scorecard1!.scorecard!.length,
                          itemBuilder: (context, i) {
                            return SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ontap[i] = !ontap[i];
                                  });
                                },
                                child: StickyHeader(
                                  header: Container(
                                    color: ontap[i]
                                        ? Color.fromARGB(255, 0, 180, 137)
                                        : Color.fromRGBO(255, 255, 255, 1),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                scorecard1!.matchType != 'test'
                                                    ? TeamName().getTeamName(
                                                        scorecard1, i)
                                                    : scorecard1!
                                                        .score![i].inning
                                                        .toString(),
                                                style: TextStyle(
                                                    color: ontap[i]
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              scorecard1!.score![i].r
                                                      .toString() +
                                                  '-' +
                                                  scorecard1!.score![i].w
                                                      .toString() +
                                                  '(' +
                                                  scorecard1!.score![i].o
                                                      .toString() +
                                                  ')',
                                              style: TextStyle(
                                                  color: ontap[i]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Icon(
                                            ontap[i]
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: ontap[i]
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  content: ontap[i]
                                      ? SizedBox(
                                          child: BattingLst(
                                              j: i, scorecard1: scorecard1!),
                                        )
                                      : SizedBox(height: 10),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 0, 180, 137),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 0, 180, 137),
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
    );
  }
}
