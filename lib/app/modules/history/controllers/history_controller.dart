import 'package:flutter/material.dart';
import 'package:flutter_task_project/app/data/sqllite_service.dart';
import 'package:flutter_task_project/app/models/search_history_model.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController

  final count = 0.obs;
  RxList<SearchHistoryModel?> searchHistorys = RxList<SearchHistoryModel?>();

  @override
  void onReady() {
    super.onReady();
    getHistorySData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHistorySData();
  }

  void increment() => count.value++;
  getHistorySData() async {
    searchHistorys.value = await SQLLiteService().getOperations();
    print("History Data");
    print(searchHistorys.value.toList());
  }

  proccedToDelete({int? id}) async {
    Get.dialog(AlertDialog(
      title: const Text('Confirmation'),
      content: Text(id != null
          ? 'Are you sure you want to proceed?'
          : "Do you want to clear all history?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: false); // Return false if canceled
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            SQLLiteService().clearData(id: id);
            await getHistorySData();
            Get.back(result: true); // Return true if confirmed
          },
          child: const Text('Confirm'),
        ),
      ],
    ));
  }
}
