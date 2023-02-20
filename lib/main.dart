import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller/itens_controller.dart';
import './home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ItensController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}
