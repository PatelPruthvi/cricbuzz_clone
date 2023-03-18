// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields
// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:cric_api/functions/date.dart';
import 'package:cric_api/functions/internet.dart';
import 'package:cric_api/functions/score.dart';
import 'package:cric_api/pages/singlematch/match_detail.dart';
import 'package:flutter/material.dart';
import 'package:cric_api/model/current.dart';
import 'package:cric_api/functions/matchesResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Match extends StatefulWidget {
  const Match({Key? key}) : super(key: key);

  @override
  State<Match> createState() => _MatchState();
}

class _MatchState extends State<Match> {
  bool isLoad = true;
  Timer? timer;

  GlobalKey<RefreshIndicatorState> _ref = GlobalKey<RefreshIndicatorState>();

  getD() async {
    await MatchRes().getData();
    if (mounted) {
      setState(() {
        isLoad = false;
      });
    }
  }

  @override
  void initState() {
    getD();
    // timer = Timer.periodic(Duration(minutes: 2), (timer) {
    //   refresh();
    // });
    super.initState();
  }

  refresh() async {
    if (await internet.checkInternet()) {
      if (mounted) {
        setState(() {});
      }

      MatchRes().getData().then((value) {
        if (mounted) {
          setState(() {
            MatchRes.data1 = value;
          });
        }
      });
    } else {
      Fluttertoast.showToast(
          msg: 'You are currently offline',
          textColor: Colors.blueGrey,
          backgroundColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: _ref,
        onRefresh: () {
          return refresh();
        },
        child: Container(
            color: Colors.grey[300],
            child: MatchRes.data1 != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ListView.builder(
                        itemCount: MatchRes.data1!.length,
                        itemBuilder: (context, index1) {
                          Data a = MatchRes.data1![index1];
                          return ListItem(a: a);
                        }),
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
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  Data a;
  ListItem({
    Key? key,
    required this.a,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              a.name.toString().split(',')[0],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              a.name.toString().split(',')[1],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                "Date: " +
                    Date()
                        .getendDate(a.matchType.toString(), a.date.toString()) +
                    ' ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[600]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text(
                  'Time: ' +
                      a.dateTimeGMT.toString().substring(11, 19) +
                      ' GMT ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Text(
                'Venue: ' + a.venue.toString(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[600]),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => DetailPage(id: a.id.toString())));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[200],
                child: ListTile(
                  // ignore: prefer_const_literals_to_create_immutables

                  title: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 0, 180, 137),
                            foregroundImage: NetworkImage(
                              a.teamInfo![0].img.toString(),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                              child: a.teamInfo![0].shortname != null
                                  ? Text(
                                      a.teamInfo![0].shortname.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      a.teamInfo![0].name.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                          Expanded(
                              child: MatchScore().getScore(
                                  a.score, a.teamInfo![0].name.toString()))
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 0, 180, 137),
                            foregroundImage: NetworkImage(
                              a.teamInfo![1].img.toString(),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                              child: a.teamInfo![0].shortname != null &&
                                      a.teamInfo!.length >= 2
                                  ? Text(
                                      a.teamInfo![1].shortname.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      // a.teamInfo![1].name.toString()
                                      '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                          Expanded(
                              child: MatchScore().getScore(
                                  a.score, a.teamInfo![1].name.toString()))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0, top: 20),
                        child: Text(
                          a.status.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 239, 25, 21)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
