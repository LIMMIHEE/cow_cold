import 'package:cow_cold/data/models/reactions/reaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  const factory Report({
    required String serverId,
    required String workServerId,
    required String createUserId,
    required String createUserName,
    required String updateDate,
    required String title,
    required String content,
    required List<Reaction>? reactions,
  }) = _Report;

  factory Report.fromJson(Map<String, Object?> json) => _$ReportFromJson(json);
}
