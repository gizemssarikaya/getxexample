import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SayacController extends GetxController {
  final  _sayac = 0.obs;
  int sayacDegeriniVer() {
    return _sayac.value;
  }

  get sayac => _sayac.value;

  set sayac(yeniDeger) => _sayac.value = yeniDeger;

  void yeniSayacDegeriAta(yeniDeger) {
    _sayac.value = yeniDeger;
  }

  void arttir() {
    sayac = sayac + 1;
    Get.snackbar('Snackbar', 'Mesaj', backgroundColor: Colors.teal);
  }

  void azalt() {
    sayac = sayac - 1;
    // ignore: deprecated_member_use
    Get.showSnackbar(GetBar(
      title: "Default Snackbar",
      message: "Deneme",
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}
