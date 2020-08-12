import 'package:json_annotation/json_annotation.dart';

import 'Profile.dart';

part 'Answer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Answer {
  int answerId;
  Profile owner;
  bool isAccepted;
  int score;
  int lastActivityDate;
  int creationDate;
  int questionId;
  String contentLicense;

  Answer({
    this.answerId,
    this.owner,
    this.isAccepted,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.questionId,
    this.contentLicense,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
