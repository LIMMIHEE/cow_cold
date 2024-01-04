import 'package:cow_cold/data/models/reactions/reaction.dart';
import 'package:cow_cold/data/models/report/report.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data/repository/test_repository.dart';

void main() {
  group('Test Reaction Model', () {
    final fireStore = FakeFirebaseFirestore();
    late TestRepository testRepository;

    setUp(
      () {
        // 더미 데이터 세팅
        testRepository = TestRepository(firestore: fireStore);
        final newReport = const Report(
          serverId: 'testId',
          workServerId: 'workServerId',
          createUserId: 'createUserId',
          createUserName: 'tester',
          updateDate: '20240103',
          title: '제목',
          content: '내용',
          reactions: [],
        ).toJson();

        newReport['reactions'] = [
          const Reaction(emoji: '❤️', reactionUsers: ['test', 'test2'])
        ].map((e) => e.toJson()).toList();
        fireStore.collection('report').add(newReport);
      },
    );

    test('get Report and Reaction', () async {
      final result = await testRepository.fetchCollection('report');
      // 테스터 확인
      expect(result.docs.first['serverId'], 'testId');

      // 리액션 데이터 확인
      List<Reaction> reactions = result.docs.first['reactions']
          .map<Reaction>(
              (dynamic i) => Reaction.fromJson(i as Map<String, dynamic>))
          .toList();
      expect(reactions.first.emoji, '❤️');
    });
  });
}
