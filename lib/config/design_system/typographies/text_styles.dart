import 'package:flutter/widgets.dart';

const TextStyle _baseTextStyle = TextStyle(
  fontFamily: 'Pretendard',
);

class TextStyles {
  TextStyles._();

  static final TextStyles _instance = TextStyles._();

  static TextStyles get instance => _instance;

  final TextStyle regular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
  );

  final TextStyle medium = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w500,
  );

  final TextStyle semiBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
  );

  final TextStyle bold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
  );
}
