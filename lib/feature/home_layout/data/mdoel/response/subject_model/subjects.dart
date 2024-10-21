
import '../../../../domain/entities/subject_entity.dart';

/// _id : "670037f6728c92b7fdf434fc"
/// name : "HTML"
/// icon : "https://exam.elevateegy.com/uploads/categories/670037f6728c92b7fdf434fa-html-language.png"
/// createdAt : "2024-10-04T18:46:14.281Z"

class Subjects {
  Subjects({
      this.id, 
      this.name, 
      this.icon, 
      this.createdAt,});

  Subjects.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? name;
  String? icon;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }

  SubjectEntity toSubject(){
    return SubjectEntity(
      name: name,
      id: id,
      imageIcon: icon
    );
  }

}