
import 'package:get/get.dart';
import 'package:function_tree/function_tree.dart';


class HomeController extends GetxController {
  var text = "".obs;
  var hasil = "".obs;

  void changeText(String data) {
    try{
      if (data == "Clear") {
      hasil.value = "";
      text.value = text.substring(0, text.value.length - 1);
    } else if (data == "AllClear") {
      text.value = "";
      hasil.value = "";
    } else {
      text.value = text.value + data;
    }

    } catch (err) {}
    
  }

  eksekusi() {
    try{

    
    hasil.value = "${text.value.interpret()}";
    } catch (err) {
      if(text.value.length != 0) {
       hasil.value = "Error";
      }
    }
  }



}

