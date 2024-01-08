import 'package:freezed_annotation/freezed_annotation.dart';

part 'work.freezed.dart';
part 'work.g.dart';

@freezed
class Work with _$Work {
  const factory Work({
    required String serverId,
    required String createUserId,
    required String createUserName,
    required String updateDate,
    required String title,
    required String category,
    required String description,
    required String inviteCode,
  }) = _Work;

  factory Work.fromJson(Map<String, Object?> json) => _$WorkFromJson(json);
}
