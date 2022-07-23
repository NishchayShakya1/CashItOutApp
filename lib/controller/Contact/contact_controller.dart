import 'package:get/get.dart';

class ContactVerify extends GetxController {
  RxBool addUser = false.obs; 
  RxBool addUserQueryToAdmin = false.obs;
  RxBool addParticularUser = false.obs;
  // our observable

  // swap true/false & save it to observable
  void toggleaddUser(bool verify) => addUser.value = verify;
  void toggleaddUserQueryToAdmin(bool verify) => addUserQueryToAdmin.value = verify;
  void toggleaddParticularUser(bool verify) => addParticularUser.value = verify;
}