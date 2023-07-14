import 'package:flutter/material.dart';
import 'package:flutter_task_project/app/data/sqllite_service.dart';
import 'package:flutter_task_project/app/models/search_user_list_model.dart';
import 'package:flutter_task_project/remote/search/search_service.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController
  late TextEditingController searchController = TextEditingController();

  final SearchService _searchService =
      Get.find(tag: (SearchService).toString());

  Rx<SearchUsersListModel?> searchUsersListModel =
      Rx<SearchUsersListModel?>(null);
  RxBool isLoading = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOld();
  }

  getOld() async {
    var argument = Get.arguments;
    if (argument != null) {
      String searchText = argument['name'];
      searchController.text = searchText;
      getSearchList();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getOld();
  }

  getSearchList() async {
    if (searchController.text != '') {
      isLoading.value = true;
      await SQLLiteService().insertOperations(searchController.text);
      searchUsersListModel = Rx<SearchUsersListModel?>(null);
      final res = await _searchService.getUserList(searchController.text);
      isLoading.value = false;
      res.fold((l) => Get.snackbar("Soory", l.message!),
          (r) => searchUsersListModel.value = r);
    }
  }
}
