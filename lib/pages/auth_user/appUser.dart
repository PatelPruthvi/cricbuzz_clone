// ignore_for_file: camel_case_types

class appUser {
  String? email;
  String? fname;
  String? phno;

  appUser({this.email, this.fname, this.phno});

  appUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fname = json['fname'];
    phno = json['phno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fname'] = fname;
    data['phno'] = phno;
    return data;
  }
}
