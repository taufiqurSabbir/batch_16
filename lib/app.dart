import 'package:flutter/material.dart';
import 'package:flutter_16/module_13/pages/about.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import 'module_12/class_3.dart';
import 'module_13/bottom_nav.dart';
import 'module_13/class_1.dart';
import 'module_13/class_2.dart';
import 'module_13/class_3.dart';
import 'module_14/class_1.dart';
import 'module_14/class_2.dart';
import 'module_14/class_3.dart';
import 'module_9/class_3.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: Size(360, 690),
     minTextAdapt: true,
     splitScreenMode: true,
     builder: (_,child){
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Flutter 16',

         initialRoute: '/Module14Class3',

         routes: {
           '/about' : (context) => about(),
           '/WidgetLifeCycle' : (context) => WidgetLifeCycle(),
           '/Module13Class2' : (context) => Module13Class2(),
           '/Module13Class3' : (context) => Module13Class3(),
           '/BottomNav' : (context) => BottomNav(),
           '/Todo' : (context) => Todo(),
           '/Module14Class2' : (context) => Module14Class2(),
           '/Module14Class3' : (context) => Module14Class3(),
         },
       );
     },
   );
  }
}
