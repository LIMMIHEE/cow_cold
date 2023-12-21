// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      serverId: json['serverId'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      customCategory: (json['customCategory'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      inviteWorks: (json['inviteWorks'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'name': instance.name,
      'id': instance.id,
      'customCategory': instance.customCategory,
      'inviteWorks': instance.inviteWorks,
    };
