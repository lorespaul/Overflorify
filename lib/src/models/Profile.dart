import 'package:json_annotation/json_annotation.dart';

part 'Profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Profile {
  int reputation;
  int userId;
  String userType;
  int acceptRate;
  Uri profileImage;
  String displayName;
  Uri link;

  Profile({
    this.reputation,
    this.userId,
    this.userType,
    this.acceptRate,
    this.profileImage,
    this.displayName,
    this.link,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
