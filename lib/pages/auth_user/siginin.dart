// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  final _form = GlobalKey<FormState>();

  movetonext(context) async {
    if (_form.currentState!.validate()) {
      try {
        final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailC.text, password: passC.text);
        setState(() {
          Navigator.pop(context);
        });
        print('user signed in');
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Icon(Icons.error_outline),
                actions: [
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('GO BACK')),
                  )
                ],
                content: Text(e.code));
          },
        );
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
          'Profile Details',
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailC,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Mail id can not be empty';
                    }
                    if (!val.contains('@')) {
                      return 'Given mail is not a Valid mail';
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter Email Id',
                      prefixIcon: Icon(Icons.mail_outline)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                child: TextFormField(
                    controller: passC,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.privacy_tip_outlined))),
              ),
              TextButton(
                  onPressed: () async {
                    if (_form.currentState!.validate()) {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailC.text);
                      print('password reset link send to email');
                    }
                  },
                  child: const Text('Forgot Password? ')),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        movetonext(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/uregister');
                      },
                      child: const Text(
                        'New to Cricbuzz? Register Here ',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
