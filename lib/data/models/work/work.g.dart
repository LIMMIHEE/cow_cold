// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkImpl _$$WorkImplFromJson(Map<String, dynamic> json) => _$WorkImpl(
      serverId: json['serverId'] as String,
      createUserId: json['createUserId'] as String,
      createUserName: json['createUserName'] as String,
      updateDate: (json['updateDate'] ?? DateTime.now().toString()) as String,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      inviteCode: json['inviteCode'] as String,
    );

Map<String, dynamic> _$$WorkImplToJson(_$WorkImpl instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'createUserId': instance.createUserId,
      'createUserName': instance.createUserName,
      'updateDate': instance.updateDate,
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'inviteCode': instance.inviteCode,
    };
