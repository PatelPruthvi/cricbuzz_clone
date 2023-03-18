// ignore_for_file: curly_braces_in_flow_control_structures

class Date {
  String getDate(String s) {
    if (s.length == 10) {
      if (s.substring(5, 7).compareTo('01') == 0)
        return 'Jan ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('02') == 0)
        return 'Feb ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('03') == 0)
        return 'Mar ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('04') == 0)
        return 'Apr ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('05') == 0)
        return 'May ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('06') == 0)
        return 'Jun ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('07') == 0)
        return 'Jul ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('08') == 0)
        return 'Aug ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('09') == 0)
        return 'Sep ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('10') == 0)
        return 'Oct ' + s.substring(8, 10);
      else if (s.substring(5, 7).compareTo('11') == 0)
        return 'Nov ' + s.substring(8, 10);
      else
        return 'Dec ' + s.substring(8, 10);
    } else
      return s;
  }

  getendDate(String a, String b) {
    if ('test'.compareTo(a) == 0) {
      int c = int.parse(getDate(b).substring(4, 6));
      c = c + 4;

      return getDate(b) + '-' + getDate(b).substring(0, 4) + '$c';
    } else {
      return getDate(b);
    }
  }
}
