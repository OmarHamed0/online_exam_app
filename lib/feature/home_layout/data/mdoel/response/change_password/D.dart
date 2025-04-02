/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MmE3YTRjY2MzZGViYTYwZGQ1NjM0MyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzMwODM3MTA4fQ.c4gzJiV-Soe90n4zxI0rfwvrUTBg3nrJ6kB3_YhC24M"
library;

class D {
  D({
      this.message, 
      this.token,});

  D.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}