// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cric_api/pages/auth_user/appUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegP extends StatefulWidget {
  const RegP({Key? key}) : super(key: key);

  @override
  State<RegP> createState() => _RegPState();
}

class _RegPState extends State<RegP> {
  TextEditingController nameC = TextEditingController();
  TextEditingController phnoC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  bool changedButton = false;
  final _formkey = GlobalKey<FormState>();

  movetonext(context) async {
    if (_formkey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(
                appUser(email: emailC.text, fname: nameC.text, phno: phnoC.text)
                    .toJson());

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 180, 137),
        elevation: 0.0,
        title: const Text(
          'Account',
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Log In/ Sign Up',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We will not send OTP to your email id',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextFormField(
                  controller: nameC,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Name can not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Full Name',
                      prefixIcon: Icon(Icons.person_outline)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phnoC,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Mobile No can not be empty';
                    }
                    if (val.contains(RegExp(r'[A-Z]')) ||
                        val.contains(RegExp(r'[a-z]'))) {
                      return 'Mobile Number must be in Numbers';
                    } else if (val.length != 10) {
                      return 'Mobile Number length invalid';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      prefixIcon: Icon(Icons.phone_android)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailC,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'E-mail can not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Email Id',
                      prefixIcon: Icon(Icons.mail_outline)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Password can not be empty..';
                      }
                      if (val.length < 6) {
                        return 'Password length must be greater than 6';
                      }
                      return null;
                    },
                    controller: passC,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.privacy_tip_outlined))),
              ),
              SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        movetonext(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )))
            ]),
          ),
        ),
      ),
    );
  }
}
