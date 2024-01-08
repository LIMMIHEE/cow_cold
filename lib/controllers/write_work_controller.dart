import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/source/local/prefs.dart';
import '../controllers/work_controller.dart';
import '../data/models/work/work.dart';
import '../data/providers/work_provider.dart';
import '../data/repositories/user_repository.dart';
import '../data/repositories/work_repository.dart';

class WriteWorkController extends GetxController {
  final WorkRepository _workRepository =
      WorkRepository(workProvider: WorkProvider());
  final UserRepository _userRepository = UserRepository.userRepository;

  final titleFocus = FocusNode();
  final descriptionFocus = FocusNode();
  final title = TextEditingController();
  final description = TextEditingController();

  RxString category = '웹소설'.obs;
  RxList<String> categoryList = <String>[].obs;
  RxBool speechTextButtonVisible = false.obs;
  List<String> customCategory = Prefs.getStringList(Prefs.customCategory);
  Work? initialWork;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  onClose() {
    titleFocus.dispose();
    descriptionFocus.dispose();
    super.onClose();
  }

  void initData() {
    if (Get.arguments != null) {
      initialWork = Get.arguments as Work;
      category.value = initialWork!.category;
      title.text = initialWork!.title;
      description.text = initialWork!.description;
    }
    categoryList.value = ['웹소설', '소설', '시나리오', ...customCategory];
    titleFocus
        .addListener(() => speechTextButtonVisible.value = titleFocus.hasFocus);
    descriptionFocus.addListener(
        () => speechTextButtonVisible.value = descriptionFocus.hasFocus);
  }

  void selectCategory(String text) {
    category.value = text;
  }

  Future<void> createOrUpdateWork() async {
    if (title.text.isEmpty) {
      Get.snackbar('작품명 입력', '작품명을 적어주세요!');
      return;
    }

    Work work = Work(
      updateDate: DateTime.now().toString(),
      title: title.text,
      category: category.value,
      description: description.text,
      serverId: '',
      createUserId: '',
      createUserName: '',
      inviteCode: '',
    );

    try {
      if (initialWork != null) {
        final updateWork = work.copyWith(
          serverId: initialWork!.serverId,
          createUserId: initialWork!.createUserId,
          createUserName: initialWork!.createUserName,
          inviteCode: initialWork!.inviteCode,
        );
        await _workRepository.updateWork(updateWork);
        Get.find<WorkController>().updateWork(updateWork);
      } else {
        Work newWork = await _workRepository.createWork(work);
        Get.find<WorkController>().addWork(newWork);
      }
      Get.back();
    } catch (error) {
      Get.snackbar('작품 추가 실패', '작품 업로드 중 문제가 발생하였습니다.');
    }
  }

  Future<void> addCategory(String category) async {
    if (category.isEmpty) {
      Get.snackbar('카테고리 입력', '카테고리가 비어있습니다.');
      return;
    }
    if (customCategory.contains(category)) {
      Get.snackbar('중복 카테고리', '이미 존재하는 카테고리 입니다.');
      return;
    }

    try {
      await _userRepository.addCategory(category);

      final newCategory = [...categoryList, category];
      Prefs.setStringList(Prefs.customCategory, [...customCategory, category]);
      categoryList.assignAll(newCategory);
      customCategory = newCategory;

      if (Get.isBottomSheetOpen ?? false) {
        Get.back();
      }
    } catch (error) {
      Get.snackbar('카테고리 추가 실패', '카테고리 업로드 중 문제가 발생하였습니다.');
    }
  }

  void inputTextFocusField(String text) {
    if (titleFocus.hasFocus) {
      title.text = text;
    } else if (descriptionFocus.hasFocus) {
      description.text = text;
    }
    update();
  }
}
