import 'package:get/get.dart';

import '../Controllers/comments_controller.dart';
import '../Controllers/video_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VideoController());
    Get.put(CommentsController());
  }
}
