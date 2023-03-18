
import 'package:clean_arch_moviee_app/core/services/services_locator.dart';
import 'package:flutter/material.dart';

import 'mobile/Presentation_Layer/PresentaionScreen.dart';

void main() {

  ServiceLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  PresentaionScreen(),
    );
  }
}


