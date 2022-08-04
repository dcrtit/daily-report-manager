import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
    required this.status,
    required this.code,
  });
  late final Message message;
  late final String status;
  late final int code;

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    message = Message.fromJson(json['message']);
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message.toJson();
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}

class Message {
  Message({
    required this.authToken,
    required this.user,
  });
  late final String authToken;
  late final User user;

  Message.fromJson(Map<String, dynamic> json){
    authToken = json['auth_token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['auth_token'] = authToken;
    data['user'] = user.toJson();
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
    this.logo,
    required this.specialization,
    required this.name,
    this.nickname,
    required this.phone,
    this.vk,
    this.instagram,
    this.facebook,
    this.gitlab,
    required this.tgUsername,
    required this.tgChat,
    this.description,
    this.cvLink,
    required this.isActive,
    required this.coffeeBreak,
    required this.city,
    this.latitude,
    this.longitude,
    required this.projects,
    required this.manager,
    required this.department,
    required this.settingAttributes,
  });
  late final int id;
  late final String email;
  late final String? logo;
  late final String specialization;
  late final String name;
  late final String? nickname;
  late final String? phone;
  late final String? vk;
  late final String? instagram;
  late final String? facebook;
  late final String? gitlab;
  late final String tgUsername;
  late final String tgChat;
  late final String? description;
  late final String? cvLink;
  late final bool isActive;
  late final bool coffeeBreak;
  late final String city;
  late final String? latitude;
  late final String? longitude;
  late final List<dynamic> projects;
  late final bool manager;
  late final String department;
  late final SettingAttributes settingAttributes;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    logo = null;
    specialization = json['specialization'];
    name = json['name'];
    nickname = null;
    phone = json['phone'];
    vk = null;
    instagram = null;
    facebook = null;
    gitlab = null;
    tgUsername = json['tg_username'];
    tgChat = json['tg_chat'];
    description = null;
    cvLink = null;
    isActive = json['is_active'];
    coffeeBreak = json['coffee_break'];
    city = json['city'];
    latitude = null;
    longitude = null;
    projects = List.castFrom<dynamic, dynamic>(json['projects']);
    manager = json['manager'];
    department = json['department'];
    settingAttributes = SettingAttributes.fromJson(json['setting_attributes']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['logo'] = logo;
    data['specialization'] = specialization;
    data['name'] = name;
    data['nickname'] = nickname;
    data['phone'] = phone;
    data['vk'] = vk;
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['gitlab'] = gitlab;
    data['tg_username'] = tgUsername;
    data['tg_chat'] = tgChat;
    data['description'] = description;
    data['cv_link'] = cvLink;
    data['is_active'] = isActive;
    data['coffee_break'] = coffeeBreak;
    data['city'] = city;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['projects'] = projects;
    data['manager'] = manager;
    data['department'] = department;
    data['setting_attributes'] = settingAttributes.toJson();
    return data;
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
    final data = <String, dynamic>{};
    data['project_page'] = projectPage;
    data['version_page'] = versionPage;
    data['task_page'] = taskPage;
    data['time_entry_page'] = timeEntryPage;
    return data;
  }
}