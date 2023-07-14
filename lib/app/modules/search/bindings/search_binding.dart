import 'package:flutter_task_project/remote/search/search_service.dart';
import 'package:flutter_task_project/remote/search/search_service_impl.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );

    Get.lazyPut<SearchService>(() => SearchServiceImpl(),
        tag: (SearchService).toString(), fenix: true);
  }
}
