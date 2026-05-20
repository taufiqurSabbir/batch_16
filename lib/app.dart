import 'package:flutter/material.dart';

import 'home.dart';
import 'module_10/class_1.dart';
import 'module_10/class_2.dart';
import 'module_10/class_3.dart';
import 'module_11/class_1.dart';
import 'module_11/class_2.dart';
import 'module_11/class_3.dart';
import 'module_11/custom_w.dart';
import 'module_12/class_1.dart';
import 'module_12/class_2.dart';
import 'module_9/class_3.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter 16',
      home: Class2Module12(),
    );
  }
}
