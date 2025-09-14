import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendor_app/cache%20manager/cache_manager.dart';

class FeedbackfromController extends GetxController with CacheManager {
  TextEditingController feedBackMessageController = TextEditingController();
  TextEditingController titleMessageController = TextEditingController();
  RxBool isLoading = RxBool(false);
}
