import 'dart:convert';

ReportResponseModel reportResponseJson(String str) =>
    ReportResponseModel.fromJson(json.decode(str));

class ReportResponseModel {
  ReportResponseModel({
    required this.message,
    required this.status,
    required this.code,
  });
  late final List<Message> message;
  late final String status;
  late final int code;

  ReportResponseModel.fromJson(Map<String, dynamic> json){
    message = List.from(json['message']).map((e)=>Message.fromJson(e)).toList();
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['code'] = code;
    return _data;
  }
}

class Message {
  Message({
    required this.user,
    required this.dates,
  });
  late final User user;
  late final List<Dates> dates;

  Message.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    dates = List.from(json['dates']).map((e)=>Dates.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['dates'] = dates.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.specialization,
    required this.department,
    required this.email,
    required this.nickname,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String specialization;
  late final String department;
  late final String email;
  late final String nickname;
  late final String logo;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    specialization = json['specialization'];
    department = json['department'];
    email = json['email'];
    nickname = json['nickname'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['specialization'] = specialization;
    _data['department'] = department;
    _data['email'] = email;
    _data['nickname'] = nickname;
    _data['logo'] = logo;
    return _data;
  }
}

class Dates {
  Dates({
    required this.date,
    this.description,
    required this.status,
  });
  late final String date;
  late final Null description;
  late final String status;

  Dates.fromJson(Map<String, dynamic> json){
    date = json['date'];
    description = null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['description'] = description;
    _data['status'] = status;
    return _data;
  }
}