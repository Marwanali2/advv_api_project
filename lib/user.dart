import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  // @JsonKey(name: 'idd') // لو الباك اند غلط و عمل ال idd بدل id  
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  User({this.id, this.name, this.email, this.gender, this.status});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);  
}
