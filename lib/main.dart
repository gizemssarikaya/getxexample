import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxornek/ceviri.dart';
import 'package:getxornek/controllers/sayac_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final SayacController _controller = Get.put(SayacController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MyColumn()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              _controller.arttir();
              print(_controller.sayac);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "2",
            onPressed: () {
              _controller.azalt();
              print(_controller.sayac);
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "3",
            foregroundColor: Get.isDarkMode ? Colors.amber : Colors.red,
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: const Icon(Icons.change_circle_sharp),
          ),
          FloatingActionButton(
            heroTag: "4",
            foregroundColor: Get.isDarkMode ? Colors.amber : Colors.red,
            onPressed: () {
              Get.to(NewPage());
            },
            child: Icon(Icons.newspaper_outlined),
          ),
          FloatingActionButton(
            heroTag: "5",
            foregroundColor: Get.isDarkMode ? Colors.amber : Colors.red,
            onPressed: () {
              Get.updateLocale(Get.locale == const Locale('tr', 'TR')
                  ? const Locale('en', 'US')
                  : const Locale('tr', 'TR'));
            },
            child: const Icon(Icons.newspaper_outlined),
          )
        ],
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  SayacController _bulunanController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'hello'.tr,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        Text(
          'button_text'.tr,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        GetX<SayacController>(
            builder: (_controller2) => Text(
                  _controller2.sayac.toString(),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                )),
        Obx(
          () => Text(
            _bulunanController.sayac.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('yeni sayfa'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Geri dön'),
        )
      ],
    ));
  }
}
