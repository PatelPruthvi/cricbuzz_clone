// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cric_api/functions/date.dart';
import 'package:flutter/material.dart';
import 'package:cric_api/model/response.dart';
import 'package:cric_api/functions/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String stat = '';

  getD() async {
    await RemoteService().getData();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getD();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RemoteService.data != null
            ? Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: RemoteService.data!.length,
                    itemBuilder: (context, index) {
                      Data d = RemoteService.data![index];
                      return ItemWidget(d: d);
                    },
                  ),
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

class ItemWidget extends StatelessWidget {
  Data d;
  ItemWidget({
    Key? key,
    required this.d,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: const Color.fromARGB(255, 3, 51, 76),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            d.name.toString(),
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 3, 51, 76)),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "ODIs: " + d.odi.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "T20Is: " + d.t20.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "TEST: " + d.test.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ]),
              ),
              const SizedBox(width: 10),
              // ignore: prefer_const_literals_to_create_immutables
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Starting: ' + Date().getDate(d.startDate.toString()),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        'Ending: ' + d.endDate.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
