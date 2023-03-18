// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:cric_api/functions/call_players.dart';
import 'package:cric_api/functions/detail_class.dart';
import 'package:cric_api/pages/singlematch/info_view.dart';
import 'package:cric_api/pages/singlematch/scr_widget.dart';
import 'package:flutter/material.dart';
import 'package:cric_api/pages/singlematch/live_score_view.dart';

class DetailPage extends StatefulWidget {
  String id;
  DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  getSD() async {
    await DetailsRes().getDaat(widget.id);
    await Playerss().getPlayers(widget.id);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getID(widget.id);
    getSD();
    super.initState();
  }

  String? a;
  getID(String id) {
    a = id;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 180, 137),
            title: DetailsRes.scorecard1 != null
                ? Text(DetailsRes.scorecard1!.teamInfo![0].shortname
                        .toString() +
                    ' vs ' +
                    DetailsRes.scorecard1!.teamInfo![1].shortname.toString())
                : Container(),
            leading: InkWell(
              onTap: () {
                setState(() {
                  DetailsRes.scorecard1 = null;
                  Playerss.dataa = null;
                });
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            bottom: const TabBar(
              unselectedLabelStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              labelStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              indicatorColor: Colors.white,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text('Squads'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text('Live '),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text('Scorecard'),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            InfoView(id: a.toString()),
            LiveScore(id: a.toString()),
            MyHomePage(id: a.toString()),
          ]),
        ),
      ),
    );
  }
}
