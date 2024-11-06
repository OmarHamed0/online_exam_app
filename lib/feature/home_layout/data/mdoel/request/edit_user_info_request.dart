class EditUserInfoRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  EditUserInfoRequest(
      {this.email, this.lastName, this.firstName, this.phone, this.username});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["username"] = username;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["email"] = email;
    map["phone"] = phone;
    return map;
  }
}
