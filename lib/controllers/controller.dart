// ignore_for_file: avoid_setters_without_getters

import 'package:get/get.dart';

class Controller extends GetxController {
  final RxInt _currentIndex = 0.obs;

  final RxInt _tabController = 0.obs;
  set switchTab(int index) {
    _tabController.value = index;
  }

  int get currentIndex {
    return _currentIndex.value;
  }

  int get tabController {
    return _tabController.value;
  }

  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  set tabController(int index) {
    _tabController.value = index;
  }
}
