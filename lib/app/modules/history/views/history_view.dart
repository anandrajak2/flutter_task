import 'package:flutter/material.dart';
import 'package:flutter_task_project/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryView'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.proccedToDelete();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Clear All",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Obx(() {
          return controller.searchHistorys.value != null
              ? ListView.builder(
                  itemCount: controller.searchHistorys.value.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.search_rounded),
                        title: Text(
                            controller.searchHistorys.value[index]?.name ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.SEARCH, arguments: {
                                  "isHistory": true,
                                  "name": controller
                                      .searchHistorys.value[index]?.name
                                });
                              },
                              icon: const Icon(Icons.send_outlined),
                              color: Theme.of(context).primaryColor,
                            ),
                            IconButton(
                              onPressed: () {
                                controller.proccedToDelete(
                                    id: controller
                                        .searchHistorys.value[index]?.id);
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Text(
                  "No History Found",
                  style: TextStyle(fontSize: 20),
                );
        }),
      ),
    );
  }
}
