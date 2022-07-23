import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LevelUp extends GetxController {
   User user = FirebaseAuth.instance.currentUser;
  // Map<String, String> user = Get.arguments;
  var myTest;
  
  LevelUp() {
    myTest = user?.email.toString();
  }
}
