// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors

import 'package:cric_api/functions/call_players.dart';
import 'package:cric_api/functions/detail_class.dart';
import 'package:flutter/material.dart';
import '../../model/singledata.dart';

class InfoView extends StatefulWidget {
  String id;

  InfoView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  Data? scorecard1;
  bool isSelected = true;
  getSD() async {
    await Playerss().getPlayers(widget.id);
    await DetailsRes().getDaat(widget.id);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getSD();
    super.initState();
  }

  getTeamShortName(String s) {
    if (s.contains(DetailsRes.scorecard1!.teamInfo![0].name.toString())) {
      return DetailsRes.scorecard1!.teamInfo![0].shortname.toString();
    } else {
      return DetailsRes.scorecard1!.teamInfo![1].shortname.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Playerss.dataa != null && DetailsRes.scorecard1 != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 10),
              Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 180, 137),
                          ),
                          color: isSelected
                              ? const Color.fromARGB(255, 0, 180, 137)
                              : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                                getTeamShortName(
                                    Playerss.dataa![0].teamName.toString()),
                                style: isSelected
                                    ? const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24)
                                    : const TextStyle(
                                        color: Color.fromARGB(255, 0, 180, 137),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = false;
                        });
                      },
                      child: Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 180, 137),
                          ),
                          color: !isSelected
                              ? const Color.fromARGB(255, 0, 180, 137)
                              : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                                getTeamShortName(
                                    Playerss.dataa![1].teamName.toString()),
                                style: !isSelected
                                    ? const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24)
                                    : const TextStyle(
                                        color: Color.fromARGB(255, 0, 180, 137),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24))),
                      )),
                    ),
                  ])),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: Colors.grey[300],
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('SQUADS'),
                    ),
                  ]),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount:
                        Playerss.dataa![isSelected ? 0 : 1].players!.length,
                    itemBuilder: (context, ind) {
                      int j = isSelected ? 0 : 1;
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              foregroundImage: NetworkImage(Playerss
                                  .dataa![isSelected ? 0 : 1]
                                  .players![ind]
                                  .playerImg
                                  .toString()),
                            ),
                            title: Text(
                              Playerss.dataa![j].players![ind].name.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            subtitle: Text(Playerss.dataa![j].players![ind].role
                                .toString()),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                          Divider(color: Colors.grey[600])
                        ]),
                      );
                    }),
              )
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
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 0, 180, 137),
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}
