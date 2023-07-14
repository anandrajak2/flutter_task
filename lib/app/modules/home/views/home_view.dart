import 'package:flutter/material.dart';
import 'package:flutter_task_project/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../widgets/custm_grid_tile_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dashboard"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              CustomGridTileWidget(
                header: "Search ",
                icon: Icons.search_outlined,
                onTap: () {
                  Get.toNamed(Routes.SEARCH);
                  // Navigator.push(
                  //     context, customRouteBuilder(const SearchScreen()));
                },
              ),
              CustomGridTileWidget(
                header: "History ",
                icon: Icons.list_alt_outlined,
                onTap: () {
                  Get.toNamed(Routes.HISTORY);
                  // Navigator.push(
                  //     context, customRouteBuilder(const HistoryScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
