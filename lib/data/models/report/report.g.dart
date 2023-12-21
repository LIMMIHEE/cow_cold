// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      serverId: json['serverId'] as String,
      workServerId: json['workServerId'] as String,
      createUserId: json['createUserId'] as String,
      createUserName: json['createUserName'] as String,
      updateDate: json['updateDate'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'workServerId': instance.workServerId,
      'createUserId': instance.createUserId,
      'createUserName': instance.createUserName,
      'updateDate': instance.updateDate,
      'title': instance.title,
      'content': instance.content,
      'reactions': instance.reactions,
    };
