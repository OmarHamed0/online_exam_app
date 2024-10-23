class ProfileRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  ProfileRequest({
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.phone,
  });
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}
