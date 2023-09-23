import 'package:get/get.dart';
import 'package:tik_tok_clone/Controllers/profile_controller.dart';

import '../Controllers/comments_controller.dart';
import '../Controllers/video_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VideoController());
    Get.put(CommentsController());
    Get.put(ProfileController());
  }
}
