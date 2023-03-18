import 'package:flutter/material.dart';

class ShortCard extends StatelessWidget {
  String a, b, c, d, e;
  bool? f = false;

  ShortCard({
    Key? key,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.e,
    this.f,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          a,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            b,
            style: f == true
                // ignore: prefer_const_constructors
                ? TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold)
                // ignore: prefer_const_constructors
                : TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: Text(
            c,
            style: f == true
                ? TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold)
                : TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            d,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            e,
            style: f == true
                ? TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold)
                : TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
