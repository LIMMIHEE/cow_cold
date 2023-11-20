import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/chip_item.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/search/search_list_item.dart';
import 'package:cow_cold/view/widget/search/search_text_field.dart';
import 'package:cow_cold/controllers/search_controller.dart'
    as get_search_contoller;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<get_search_contoller.SearchController>(
      init: get_search_contoller.SearchController(),
      builder: (controller) {
        return ScaffoldBody(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: DesignSystem.colors.black,
              title: SearchTextField(
                  controller: controller.search,
                  onSubmitted: () => controller.searchWork()),
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: DesignSystem.colors.white,
                    size: 20,
                  )),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(left: 65, top: 12, bottom: 12),
                  color: DesignSystem.colors.black,
                  child: Row(
                    children: [
                      for (final filter in controller.filterList)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChipItem(
                            text: filter,
                            backgroundColor: DesignSystem.colors.black,
                            selectText: controller.filter.value,
                            onTap: (text) => controller.selectFilter(text),
                          ),
                        ),
                    ],
                  ),
                ),
                controller.resultList.isNotEmpty && controller.isSearchStart
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('검색 결과 ${controller.resultList.length}건',
                                    style: DesignSystem.typography.body()),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(top: 12),
                                  shrinkWrap: true,
                                  itemCount: controller.resultList.length,
                                  itemBuilder: (context, index) {
                                    final work =
                                        controller.resultList.elementAt(index);

                                    return SearchListItem(work: work);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          !controller.isSearchStart
                              ? "검색을 진행해주세요"
                              : "검색 결과가 없습니다.",
                          style: DesignSystem.typography.body(TextStyle(
                              color: DesignSystem.colors.gray700,
                              fontWeight: FontWeight.w400)),
                        ),
                      )
              ],
            ));
      },
    );
  }
}
