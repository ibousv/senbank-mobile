import 'package:flutter/material.dart';
import 'package:senbank/src/ui/views/home.template.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SenBank',
      home:  HomePage(),
    );
  }
}


