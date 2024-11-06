class ChangePasswordRequest{
  String ? oldPassword;
  String ? password;
  String ? rePassword;

  ChangePasswordRequest(this.oldPassword,this.password,this.rePassword);

  Map<String,dynamic>toJson(){
    Map<String,dynamic>map={};
    map["oldPassword"]=oldPassword;
    map["password"]=password;
    map["rePassword"]=rePassword;
    return map;
  }
}