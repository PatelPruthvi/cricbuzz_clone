// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:cric_api/pages/singlematch/live_score_view.dart';

import '../../model/singledata.dart';

class BattingLst extends StatefulWidget {
  Data scorecard1;
  int j;
  BattingLst({
    Key? key,
    required this.scorecard1,
    required this.j,
  }) : super(key: key);

  @override
  State<BattingLst> createState() => _BattingLstState();
}

class _BattingLstState extends State<BattingLst> {
  @override
  void initState() {
    getsccrd(widget.scorecard1, widget.j);
    super.initState();
  }

  Data? scorecard1;
  int i = 0;
  getsccrd(Data scorecrd1, int j) {
    scorecard1 = scorecrd1;
    i = j;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Color.fromARGB(255, 190, 194, 185),
        child: Row(children: [
          Expanded(
              child: Text(
            '  Batter',
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          physics: ClampingScrollPhysics(),
          itemCount: scorecard1!.scorecard![i].batting!.length,
          itemBuilder: (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: prefer_const_literals_to_create_immutables
                  ListViewScore(score: scorecard1!, i: i, inde: index),
                  Divider(
                    color: Colors.grey[800],
                  ),
                ]);
          }),
      Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                'Extras',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'b ' + scorecard1!.scorecard![i].extras!.b.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                        fontSize: 16),
                  ),
                  Text(
                    'lb ' + scorecard1!.scorecard![i].extras!.lb.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                        fontSize: 16),
                  ),
                  Text(
                    'w ' + scorecard1!.scorecard![i].extras!.w.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                        fontSize: 16),
                  ),
                  Text(
                    'nb ' + scorecard1!.scorecard![i].extras!.nb.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                        fontSize: 16),
                  ),
                  Text(
                    'p ' + scorecard1!.scorecard![i].extras!.p.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Divider(color: Colors.grey[800]),
      Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                'Totals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Row(
              children: [
                Text(
                  scorecard1!.scorecard![i].totals!.r.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '(' +
                      scorecard1!.scorecard![i].totals!.o.toString() +
                      " Overs,",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 17),
                ),
                Text(
                  ' RR: ' +
                      scorecard1!.scorecard![i].totals!.rR.toString() +
                      ")",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 17),
                )
              ],
            ),
          ],
        ),
      ),
      Divider(color: Colors.grey[800]),
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Color.fromARGB(255, 190, 194, 185),
        child: Row(children: [
          Expanded(
              child: Text(
            '  Bowler',
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          )
        ]),
      ),
      SizedBox(
          height: 300,
          child: ListView.builder(
              itemCount: scorecard1!.scorecard![i].bowling!.length,
              itemBuilder: (context, index2) {
                return BowlerItem(a: i, scorecrd: scorecard1!, b: index2);
              }))
    ]);
  }
}

class BowlerItem extends StatefulWidget {
  Data scorecrd;
  int a;
  int b;

  BowlerItem({
    Key? key,
    required this.scorecrd,
    required this.a,
    required this.b,
  }) : super(key: key);

  @override
  State<BowlerItem> createState() => _BowlerItemState();
}

class _BowlerItemState extends State<BowlerItem> {
  @override
  void initState() {
    getSD(widget.scorecrd, widget.a, widget.b);
    super.initState();
  }

  Data? scorecard1;
  late int i;
  late int index2;

  getSD(Data? ScrCrd, int a, int j) {
    scorecard1 = ScrCrd;
    index2 = j;
    i = a;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8),
              child: Text(
                scorecard1!.scorecard![i].bowling![index2].bowler!.name
                    .toString(),
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
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
                    scorecard1!.scorecard![i].bowling![index2].o.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 30,
                  child: Text(
                    scorecard1!.scorecard![i].bowling![index2].m.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 30,
                  child: Text(
                      scorecard1!.scorecard![i].bowling![index2].r.toString(),
                      style: TextStyle(fontSize: 16)),
                ),
                SizedBox(
                  width: 20,
                  child: Text(
                      scorecard1!.scorecard![i].bowling![index2].w.toString(),
                      style: TextStyle(fontSize: 16)),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                      scorecard1!.scorecard![i].bowling![index2].eco!
                          .toStringAsFixed(2),
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ]);
  }
}
