// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileModel _$$_UserProfileModelFromJson(Map<String, dynamic> json) =>
    _$_UserProfileModel(
      profilePic: json['profilePic'] as String,
      uid: json['uid'] as String,
      userWeight: json['userWeight'] as String,
      userHeight: json['userHeight'] as String,
      userFitnessLevel: json['userFitnessLevel'] as String,
      preferences: (json['preferences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userEmail: json['userEmail'] as String,
    );

Map<String, dynamic> _$$_UserProfileModelToJson(_$_UserProfileModel instance) =>
    <String, dynamic>{
      'profilePic': instance.profilePic,
      'uid': instance.uid,
      'userWeight': instance.userWeight,
      'userHeight': instance.userHeight,
      'userFitnessLevel': instance.userFitnessLevel,
      'preferences': instance.preferences,
      'userEmail': instance.userEmail,
    };
