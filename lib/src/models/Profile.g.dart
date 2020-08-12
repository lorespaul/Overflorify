// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    reputation: json['reputation'] as int,
    userId: json['user_id'] as int,
    userType: json['user_type'] as String,
    acceptRate: json['accept_rate'] as int,
    profileImage: json['profile_image'] == null
        ? null
        : Uri.parse(json['profile_image'] as String),
    displayName: json['display_name'] as String,
    link: json['link'] == null ? null : Uri.parse(json['link'] as String),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'reputation': instance.reputation,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'accept_rate': instance.acceptRate,
      'profile_image': instance.profileImage?.toString(),
      'display_name': instance.displayName,
      'link': instance.link?.toString(),
    };
