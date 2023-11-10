import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectIndex = 0.obs;

  void changeTab(int index) {
    selectIndex.value = index;
  }
}
