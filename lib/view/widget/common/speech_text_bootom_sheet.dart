import 'package:avatar_glow/avatar_glow.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechTextBottomSheet extends StatefulWidget {
  const SpeechTextBottomSheet({Key? key, required this.speechComplete})
      : super(key: key);

  final Function(String) speechComplete;

  @override
  State<SpeechTextBottomSheet> createState() => _SpeechTextBottomSheetState();
}

class _SpeechTextBottomSheetState extends State<SpeechTextBottomSheet> {
  final SpeechToText _speech = SpeechToText();
  String _lastWords = '';
  bool _hasSpeech = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Expanded(
          child: Center(
            child: Text(
              _speech.isListening || _lastWords.isNotEmpty
                  ? _lastWords
                  : '하단의 버튼을 누른 상태로 이야기 해주세요.',
            ),
          ),
        ),
        const SizedBox(height: 20),
        AvatarGlow(
          endRadius: 75,
          animate: _hasSpeech,
          duration: const Duration(milliseconds: 2000),
          glowColor: DesignSystem.colors.appPrimary,
          repeat: true,
          repeatPauseDuration: const Duration(milliseconds: 100),
          showTwoGlows: true,
          child: InkWell(
            borderRadius: BorderRadius.circular(35),
            onTapDown: (details) async {
              if (!_speech.isAvailable) {
                await _speech.initialize(
                  finalTimeout: const Duration(seconds: 30),
                );
              }

              setState(() {
                _hasSpeech = true;
                _speech.listen(
                  localeId: 'ko_KR',
                  listenFor: const Duration(minutes: 1),
                  pauseFor: const Duration(seconds: 6),
                  onResult: (result) {
                    setState(() {
                      _lastWords = result.recognizedWords;
                    });
                  },
                );
              });
            },
            onTapUp: (details) {
              setState(() {
                _hasSpeech = false;
              });
              _speech.stop();
            },
            child: CircleAvatar(
              backgroundColor: DesignSystem.colors.appPrimary,
              radius: 35,
              child: Icon(
                _hasSpeech ? Icons.mic : Icons.mic_none,
                color: DesignSystem.colors.white,
              ),
            ),
          ),
        ),
        Visibility(
          visible: _lastWords.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: SizedBox(
              width: double.infinity,
              child: BottomButton(
                text: '완료',
                backgroundColor: DesignSystem.colors.appSecondary,
                textColor: DesignSystem.colors.white,
                paddingVisible: false,
                onTap: () {
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 750), () {
                    widget.speechComplete(_lastWords);
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
