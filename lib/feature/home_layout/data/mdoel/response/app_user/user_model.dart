
import '../../../../domain/entities/app_user_entity.dart';

/// _id : "67113b7570966b47d2983207"
/// username : "eleovate"
/// firstName : "Elooevate"
/// lastName : "Teoeech"
/// email : "admien@elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// createdAt : "2024-10-17T16:29:41.003Z"

class UserModel {
  UserModel({
      this.id, 
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.role, 
      this.isVerified, 
      this.createdAt,});

  UserModel.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    return map;
  }

  }
