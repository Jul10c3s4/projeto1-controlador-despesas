import 'package:controlador_despesas/pages/homepage.dart';
import 'package:controlador_despesas/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: <String, WidgetBuilder>{
        '/homepage':(context) => const HomePage(),
        '/splash': (context) => const SplashSreen(rota: '/homepage')
      } 
       
    );
  }
}
