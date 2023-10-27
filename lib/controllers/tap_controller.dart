import 'package:get/get.dart';

class TapController extends GetxController {
  int _X = 0;
  int get X => _X;

  void IncreaseX() {
    _X++;
    update();
  }
  void DecrementX(){
    _X--;
    update();
  }
}
