import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const _storage = FlutterSecureStorage();

  static void write(String key, String value) async =>
      await _storage.write(key: key, value: value);

  static void writeList(String key, List<String> value) async =>
      await _storage.write(key: key, value: jsonEncode(value));

  static Future<String?> read(String key) async =>
      await _storage.read(key: key);

  static Future<List<dynamic>> readList(String key) async {
    final value = await _storage.read(key: key) ?? '';
    return value.isNotEmpty ? jsonDecode(value) : [];
  }

  static Future<bool> containsKey(String key) async =>
      await _storage.containsKey(key: key);

  static void delete(String key) async => await _storage.delete(key: key);

  static void deleteAll() async => await _storage.deleteAll();

  static const String email = "email";
  static const String uid = "uid";
  static const String password = "password";
  static const String inviteWork = "invite_work";
}
