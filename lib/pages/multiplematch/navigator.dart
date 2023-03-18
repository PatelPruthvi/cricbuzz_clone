import 'package:cric_api/pages/multiplematch/current_match.dart';
import 'package:cric_api/pages/multiplematch/series.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool user = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 180, 137),
              elevation: 0.0,
              title: Image.asset(
                'assets/images/cricbuzz_op.png',
                scale: 2,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.currentUser != null
                            ? Navigator.pushNamed(context, '/auth')
                                .then((value) {
                                setState(() {});
                              })
                            : Navigator.pushNamed(context, '/usign')
                                .then((value) {
                                setState(() {});
                              });
                      },
                      child: FirebaseAuth.instance.currentUser != null
                          ? const Icon(
                              CupertinoIcons.person_crop_circle,
                              color: Colors.white,
                              size: 40,
                            )
                          : const Text(
                              'Log In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )),
                )
              ],
              bottom: const TabBar(
                  unselectedLabelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  labelStyle:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  indicatorColor: Colors.white,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15),
                      child: Text(
                        'Current Matches ',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15),
                      child: Text(
                        'Upcoming Series',
                      ),
                    ),
                  ]),
            ),
            drawer: const Drawer(),
            body: const TabBarView(
              children: [Match(), HomePage()],
            )),
      ),
    );
  }
}
