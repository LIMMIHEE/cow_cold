// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get serverId => throw _privateConstructorUsedError;
  String get workServerId => throw _privateConstructorUsedError;
  String get createUserId => throw _privateConstructorUsedError;
  String get createUserName => throw _privateConstructorUsedError;
  String get updateDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<Reaction>? get reactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {String serverId,
      String workServerId,
      String createUserId,
      String createUserName,
      String updateDate,
      String title,
      String content,
      List<Reaction>? reactions});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = null,
    Object? workServerId = null,
    Object? createUserId = null,
    Object? createUserName = null,
    Object? updateDate = null,
    Object? title = null,
    Object? content = null,
    Object? reactions = freezed,
  }) {
    return _then(_value.copyWith(
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
      workServerId: null == workServerId
          ? _value.workServerId
          : workServerId // ignore: cast_nullable_to_non_nullable
              as String,
      createUserId: null == createUserId
          ? _value.createUserId
          : createUserId // ignore: cast_nullable_to_non_nullable
              as String,
      createUserName: null == createUserName
          ? _value.createUserName
          : createUserName // ignore: cast_nullable_to_non_nullable
              as String,
      updateDate: null == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Reaction>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
          _$ReportImpl value, $Res Function(_$ReportImpl) then) =
      __$$ReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serverId,
      String workServerId,
      String createUserId,
      String createUserName,
      String updateDate,
      String title,
      String content,
      List<Reaction>? reactions});
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
      _$ReportImpl _value, $Res Function(_$ReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = null,
    Object? workServerId = null,
    Object? createUserId = null,
    Object? createUserName = null,
    Object? updateDate = null,
    Object? title = null,
    Object? content = null,
    Object? reactions = freezed,
  }) {
    return _then(_$ReportImpl(
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
      workServerId: null == workServerId
          ? _value.workServerId
          : workServerId // ignore: cast_nullable_to_non_nullable
              as String,
      createUserId: null == createUserId
          ? _value.createUserId
          : createUserId // ignore: cast_nullable_to_non_nullable
              as String,
      createUserName: null == createUserName
          ? _value.createUserName
          : createUserName // ignore: cast_nullable_to_non_nullable
              as String,
      updateDate: null == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: freezed == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Reaction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportImpl implements _Report {
  const _$ReportImpl(
      {required this.serverId,
      required this.workServerId,
      required this.createUserId,
      required this.createUserName,
      required this.updateDate,
      required this.title,
      required this.content,
      required final List<Reaction>? reactions})
      : _reactions = reactions;

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  @override
  final String serverId;
  @override
  final String workServerId;
  @override
  final String createUserId;
  @override
  final String createUserName;
  @override
  final String updateDate;
  @override
  final String title;
  @override
  final String content;
  final List<Reaction>? _reactions;
  @override
  List<Reaction>? get reactions {
    final value = _reactions;
    if (value == null) return null;
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Report(serverId: $serverId, workServerId: $workServerId, createUserId: $createUserId, createUserName: $createUserName, updateDate: $updateDate, title: $title, content: $content, reactions: $reactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.workServerId, workServerId) ||
                other.workServerId == workServerId) &&
            (identical(other.createUserId, createUserId) ||
                other.createUserId == createUserId) &&
            (identical(other.createUserName, createUserName) ||
                other.createUserName == createUserName) &&
            (identical(other.updateDate, updateDate) ||
                other.updateDate == updateDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serverId,
      workServerId,
      createUserId,
      createUserName,
      updateDate,
      title,
      content,
      const DeepCollectionEquality().hash(_reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportImplToJson(
      this,
    );
  }
}

abstract class _Report implements Report {
  const factory _Report(
      {required final String serverId,
      required final String workServerId,
      required final String createUserId,
      required final String createUserName,
      required final String updateDate,
      required final String title,
      required final String content,
      required final List<Reaction>? reactions}) = _$ReportImpl;

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  @override
  String get serverId;
  @override
  String get workServerId;
  @override
  String get createUserId;
  @override
  String get createUserName;
  @override
  String get updateDate;
  @override
  String get title;
  @override
  String get content;
  @override
  List<Reaction>? get reactions;
  @override
  @JsonKey(ignore: true)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
