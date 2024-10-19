import 'metadata.dart';
import 'subjects.dart';

/// message : "success"
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// subjects : [{"_id":"670037f6728c92b7fdf434fc","name":"HTML","icon":"https://exam.elevateegy.com/uploads/categories/670037f6728c92b7fdf434fa-html-language.png","createdAt":"2024-10-04T18:46:14.281Z"},{"_id":"670038f7728c92b7fdf43501","name":"CSS","icon":"https://exam.elevateegy.com/uploads/categories/670038f7728c92b7fdf434ff-css.png","createdAt":"2024-10-04T18:50:31.606Z"},{"_id":"670039c3728c92b7fdf43506","name":"Javascript","icon":"https://exam.elevateegy.com/uploads/categories/670039c3728c92b7fdf43504-javascript.png","createdAt":"2024-10-04T18:53:55.992Z"},{"_id":"67003a9a728c92b7fdf4350a","name":"Angular","icon":"https://exam.elevateegy.com/uploads/categories/67003a9a728c92b7fdf43508-angularjs.png","createdAt":"2024-10-04T18:57:30.499Z"},{"_id":"67003aad728c92b7fdf4350e","name":"React","icon":"https://exam.elevateegy.com/uploads/categories/67003aad728c92b7fdf4350c-react.png","createdAt":"2024-10-04T18:57:49.959Z"},{"_id":"67003b69728c92b7fdf43512","name":"Flutter","icon":"https://exam.elevateegy.com/uploads/categories/67003b69728c92b7fdf43510-Flutter.png","createdAt":"2024-10-04T19:00:57.863Z"}]

class SubjectModel {
  SubjectModel({
      this.message, 
      this.metadata, 
      this.subjects,});

  SubjectModel.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subjects.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Subjects>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}