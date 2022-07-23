import 'package:get/get.dart';

class HomeVerify extends GetxController {
  RxBool user = false.obs; 
  RxBool adminPanel = false.obs;
  RxBool particularUser = false.obs;
  // our observable

  // swap true/false & save it to observable
  void toggleuser(bool verify) => user.value = verify;
  void toggleadminPanel(bool verify) => adminPanel.value = verify;
  void toggleparticularUser(bool verify) => particularUser.value = verify;
}