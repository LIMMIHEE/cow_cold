import 'package:cow_cold/controllers/report_controller.dart';

class MockReportController extends ReportController {

  @override
  Future<void> onInit() async {
    userId = 'testUserId';
  }
}
