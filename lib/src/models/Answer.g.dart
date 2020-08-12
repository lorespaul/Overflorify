// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    answerId: json['answer_id'] as int,
    owner: json['owner'] == null
        ? null
        : Profile.fromJson(json['owner'] as Map<String, dynamic>),
    isAccepted: json['is_accepted'] as bool,
    score: json['score'] as int,
    lastActivityDate: json['last_activity_date'] as int,
    creationDate: json['creation_date'] as int,
    questionId: json['question_id'] as int,
    contentLicense: json['content_license'] as String,
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'answer_id': instance.answerId,
      'owner': instance.owner,
      'is_accepted': instance.isAccepted,
      'score': instance.score,
      'last_activity_date': instance.lastActivityDate,
      'creation_date': instance.creationDate,
      'question_id': instance.questionId,
      'content_license': instance.contentLicense,
    };
