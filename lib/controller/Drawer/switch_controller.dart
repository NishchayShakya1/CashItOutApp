import 'package:get/get.dart';

class SwitchX extends GetxController {
  RxInt on = 0.obs; // our observable

  // swap true/false & save it to observable
  void toggle(int a) => on.value = a;
}