import 'package:cric_api/model/current.dart';
import 'package:flutter/material.dart';

class MatchScore {
  getScore(List<Score>? s, String y) {
    if (s!.length == 4) {
      if (s[0].inning.toString().contains(y)) {
        return Text(
          s[0].r.toString() +
              '-' +
              s[0].w.toString() +
              '(' +
              s[0].o.toString() +
              ') & ' +
              s[2].r.toString() +
              '-' +
              s[2].w.toString() +
              '(' +
              s[2].o.toString() +
              ')',
          style: const TextStyle(fontWeight: FontWeight.w600),
        );
      } else {
        return Text(
          s[1].r.toString() +
              '-' +
              s[1].w.toString() +
              '(' +
              s[1].o.toString() +
              ') & ' +
              s[3].r.toString() +
              '-' +
              s[3].w.toString() +
              '(' +
              s[3].o.toString() +
              ') ',
          style: const TextStyle(fontWeight: FontWeight.w600),
        );
      }
    } else if (s.length == 3) {
      if (s[0].inning.toString().contains(y)) {
        return Text(
          s[0].r.toString() +
              '-' +
              s[0].w.toString() +
              '(' +
              s[0].o.toString() +
              ') & ' +
              s[2].r.toString() +
              '-' +
              s[2].w.toString() +
              '(' +
              s[2].o.toString() +
              ')',
          style: const TextStyle(fontWeight: FontWeight.w600),
        );
      } else {
        return Text(
          s[1].r.toString() +
              '-' +
              s[1].w.toString() +
              '(' +
              s[1].o.toString() +
              ')',
          style: const TextStyle(fontWeight: FontWeight.w600),
        );
      }
    } else if (s.length == 2) {
      if (s[0].inning.toString().contains(y)) {
        return Text(
          s[0].r.toString() +
              '-' +
              s[0].w.toString() +
              '(' +
              s[0].o.toString() +
              ')  ',
          style: const TextStyle(fontWeight: FontWeight.w600),
        );
      } else {
        return Text(
          s[1].r.toString() +
              '-' +
              s[1].w.toString() +
              '(' +
              s[1].o.toString() +
              ')  ',
          style: const TextStyle(fontWeight: FontWeight.w600),
        );
      }
    } else {
      return const Text('');
    }
  }
}
