/// people : [{"user_id":"12","first_name":"ali","last_name":"hima","full_name":"ali hima","gender":"male"},{"user_id":"11","first_name":"mohamed","last_name":"mansour","full_name":"mohamed mansour","gender":"male"},{"user_id":"10","first_name":"kamel","last_name":"ali","full_name":"kamel ali","gender":"male"},{"user_id":"9","first_name":"nora","last_name":"ali","full_name":"nora ali","gender":"Female"},{"user_id":"8","first_name":"asmaa","last_name":"kamel","full_name":"asmaa kamel","gender":"female"},{"user_id":"7","first_name":"khaled","last_name":"ahmed","full_name":"khaled ahmed","gender":"male"},{"user_id":"15","first_name":"emad","last_name":"mohamed","full_name":"emad mohamed","gender":"male"},{"user_id":"16","first_name":"aliaa","last_name":"reda","full_name":"aliaa reda","gender":"female"},{"user_id":"16","first_name":"zeinab","last_name":"dewedar","full_name":"zeinab dewedar","gender":"female"},{"user_id":"20","first_name":"ragab","last_name":"mansour","full_name":"ragab masnour","gender":"male"}]

class FilterResponse {
  FilterResponse({
      this.people,});

  FilterResponse.fromJson(dynamic json) {
    if (json['people'] != null) {
      people = [];
      json['people'].forEach((v) {
        people?.add(People.fromJson(v));
      });
    }
  }
  List<People>? people;
  FilterResponse copyWith({  List<People>? people,
}) => FilterResponse(  people: people ?? this.people,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (people != null) {
      map['people'] = people?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// user_id : "12"
/// first_name : "ali"
/// last_name : "hima"
/// full_name : "ali hima"
/// gender : "male"

class People {
  People({
      this.userId, 
      this.firstName, 
      this.lastName, 
      this.fullName, 
      this.gender,});

  People.fromJson(dynamic json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    gender = json['gender'];
  }
  String? userId;
  String? firstName;
  String? lastName;
  String? fullName;
  String? gender;
People copyWith({  String? userId,
  String? firstName,
  String? lastName,
  String? fullName,
  String? gender,
}) => People(  userId: userId ?? this.userId,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  fullName: fullName ?? this.fullName,
  gender: gender ?? this.gender,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['full_name'] = fullName;
    map['gender'] = gender;
    return map;
  }

}