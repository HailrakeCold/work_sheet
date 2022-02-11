
import 'package:flutter/material.dart';
import 'package:work_sheet/pages/home.dart';
import 'package:work_sheet/pages/_mainScreens.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.indigoAccent,
  ),
  initialRoute: '/',
  routes:{
    '/':(context)=> MainScreen(),
    '/todo':(context)=> Home()
  },
));

