import 'package:flutter/material.dart';

import 'package:saa_asset_management_frontend/screens/main_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAA Asset Management',
      debugShowCheckedModeBanner: false, 
      
      home: const MainScreen(), 
    );
  }
}