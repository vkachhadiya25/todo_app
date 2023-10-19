import 'dart:ui';

class dataModel {
  String? title, desc;

  dataModel({this.desc, this.title});

  factory dataModel.fromMap(Map m1) {
    dataModel d1 = dataModel(
      title: m1['title'],
      desc:  m1['desc'],
    );
    return d1;
  }
}


