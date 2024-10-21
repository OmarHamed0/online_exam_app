
import '../../../../domain/entities/app_user_entity.dart';
import 'user_model.dart';

/// message : "success"
/// user : {"_id":"67113b7570966b47d2983207","username":"eleovate","firstName":"Elooevate","lastName":"Teoeech","email":"admien@elevate.com","phone":"01094155711","role":"user","isVerified":false,"createdAt":"2024-10-17T16:29:41.003Z"}

class AppUserModel {
  AppUserModel({
      this.message, 
      this.user,});

  AppUserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  String? message;
  UserModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
  AppUserEntity ?  toAppUserEntity(){
    return AppUserEntity(
      phone: user?.phone,
      username: user?.username,
      firstName: user?.firstName,
      lastName: user?.lastName,
      email:user?.email,
      id: user?.id
    );
  }

}