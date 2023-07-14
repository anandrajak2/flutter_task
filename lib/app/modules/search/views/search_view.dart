import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/single_list_item_widget.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SearchView'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            // shrinkWrap: true,
            // padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            // physics: const NeverScrollableScrollPhysics(),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.size.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.72,
                      height: 60,
                      child: TextFormField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          hintText: "Search User",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(0)),
                        ),
                        onFieldSubmitted: (value) {
                          controller.getSearchList();
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.getSearchList();
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              // borderRadius: const BorderRadius.only(
                              //     topRight: Radius.circular(10.0),
                              //     bottomRight: Radius.circular(10.0)),
                              border: Border(
                            right: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                            top: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                            bottom: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),

                            // width: 2, color: Theme.of(context).primaryColor,
                          )),
                          child: const Icon(Icons.search_outlined),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  return controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: controller
                                  .searchUsersListModel.value?.items.length ??
                              0,
                          itemBuilder: (context, index) {
                            return GlistTileWidget(
                              item: controller
                                  .searchUsersListModel.value!.items[index],
                            );
                          },
                        );
                }),
              ),
            ],
          ),
        ));
  }
}
