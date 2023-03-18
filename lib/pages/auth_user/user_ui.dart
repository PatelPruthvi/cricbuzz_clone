// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DocumentSnapshot? userInfo;
  bool isLoading = true;
  bool rOnly = true;
  bool rOnly2 = true;
  bool onchng = false;
  bool onchng2 = false;
  final _formkey = GlobalKey<FormState>();
  String fname = '';
  String phno = '';
  String email = '';

  getData() async {
    DocumentSnapshot userInfo = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    fname = userInfo['fname'];
    phno = userInfo['phno'];
    email = userInfo['email'];
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 180, 137),
        elevation: 0.0,
        title: const Text('Profile Details',
            style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w600)),
        actions: [
          TextButton(
              onPressed: () {
                onchng || onchng2 ? print('hi') : null;
              },
              child: Text(
                'Update',
                style: onchng || onchng2
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)
                    : TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: isLoading == false
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text('Full Name'),
                    TextFormField(
                      initialValue: fname,
                      readOnly: rOnly2,
                      onChanged: (val) {
                        setState(() {
                          onchng = true;
                        });
                      },
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                      decoration: InputDecoration(
                          suffix: InkWell(
                              child: Text(
                                'CHANGE',
                                style: TextStyle(color: Colors.teal),
                              ),
                              onTap: () {
                                rOnly2 = !rOnly2;
                                setState(() {});
                              }),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    Text('Mobile No(+91)'),
                    TextFormField(
                      initialValue: phno,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                      enabled: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    Text('UserName'),
                    TextFormField(
                      readOnly: rOnly,
                      initialValue: email.split('@')[0],
                      onChanged: (val) {
                        setState(() {
                          onchng2 = true;
                        });
                      },
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                      decoration: InputDecoration(
                          suffix: InkWell(
                              child: Text(
                                'CHANGE',
                                style: TextStyle(color: Colors.teal),
                              ),
                              onTap: () {
                                rOnly = !rOnly;
                                setState(() {});
                              }),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    Text('Email ID'),
                    TextFormField(
                      initialValue: email,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                      enabled: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Coming Sooon...',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              duration: Duration(milliseconds: 1250),
                            ));
                          },
                          child: Text('Manage subscriptions')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Do You Want To Sign Out ? '),
                                    content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('No')),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  await FirebaseAuth.instance
                                                      .signOut();
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Yes')),
                                          )
                                        ]),
                                  );
                                });
                          },
                          icon: Icon(Icons.power_settings_new),
                          label: Text('Sign Out')),
                    )
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
