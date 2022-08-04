import 'dart:convert';

UsersResponseModel usersResponseJson(String str) =>
    UsersResponseModel.fromJson(json.decode(str));

class UsersResponseModel {
  UsersResponseModel({
    required this.message,
    required this.status,
    required this.code,
  });
  late final List<Message> message;
  late final String status;
  late final int code;

  UsersResponseModel.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.email,
    required this.logo,
    required this.specialization,
    required this.name,
    required this.nickname,
    required this.phone,
    required this.vk,
    required this.instagram,
    required this.facebook,
    required this.gitlab,
    required this.tgUsername,
    required this.tgChat,
    required this.description,
    required this.cvLink,
    required this.isActive,
    required this.coffeeBreak,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.projects,
    required this.manager,
    required this.department,
    required this.settingAttributes,
  });
  late final int id;
  late final String email;
  late final String logo;
  late final String specialization;
  late final String name;
  late final String nickname;
  late final String phone;
  late final String vk;
  late final String instagram;
  late final String facebook;
  late final String gitlab;
  late final String tgUsername;
  late final String tgChat;
  late final String description;
  late final String cvLink;
  late final bool isActive;
  late final bool coffeeBreak;
  late final String city;
  late final double latitude;
  late final double longitude;
  late final List<Projects> projects;
  late final bool manager;
  late final String department;
  late final SettingAttributes settingAttributes;

  Message.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    logo = json['logo'];
    specialization = json['specialization'];
    name = json['name'];
    nickname = json['nickname'];
    phone = json['phone'];
    vk = json['vk'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    gitlab = json['gitlab'];
    tgUsername = json['tg_username'];
    tgChat = json['tg_chat'];
    description = json['description'];
    cvLink = json['cv_link'];
    isActive = json['is_active'];
    coffeeBreak = json['coffee_break'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    projects = List.from(json['projects']).map((e)=>Projects.fromJson(e)).toList();
    manager = json['manager'];
    department = json['department'];
    settingAttributes = SettingAttributes.fromJson(json['setting_attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['logo'] = logo;
    _data['specialization'] = specialization;
    _data['name'] = name;
    _data['nickname'] = nickname;
    _data['phone'] = phone;
    _data['vk'] = vk;
    _data['instagram'] = instagram;
    _data['facebook'] = facebook;
    _data['gitlab'] = gitlab;
    _data['tg_username'] = tgUsername;
    _data['tg_chat'] = tgChat;
    _data['description'] = description;
    _data['cv_link'] = cvLink;
    _data['is_active'] = isActive;
    _data['coffee_break'] = coffeeBreak;
    _data['city'] = city;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['projects'] = projects.map((e)=>e.toJson()).toList();
    _data['manager'] = manager;
    _data['department'] = department;
    _data['setting_attributes'] = settingAttributes.toJson();
    return _data;
  }
}

class Projects {
  Projects({
    required this.id,
    required this.name,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String logo;

  Projects.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['logo'] = logo;
    return _data;
  }
}

class SettingAttributes {
  SettingAttributes({
    required this.projectPage,
    required this.versionPage,
    required this.taskPage,
    required this.timeEntryPage,
  });
  late final bool projectPage;
  late final bool versionPage;
  late final bool taskPage;
  late final bool timeEntryPage;

  SettingAttributes.fromJson(Map<String, dynamic> json){
    projectPage = json['project_page'];
    versionPage = json['version_page'];
    taskPage = json['task_page'];
    timeEntryPage = json['time_entry_page'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['project_page'] = projectPage;
    _data['version_page'] = versionPage;
    _data['task_page'] = taskPage;
    _data['time_entry_page'] = timeEntryPage;
    return _data;
  }
}