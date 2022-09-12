import 'package:controlador_despesas/domain/despesas.dart';
import 'package:controlador_despesas/pages/adicionardespesa.dart';
import 'package:controlador_despesas/pages/homepage.dart';
import 'package:controlador_despesas/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("pt", "BR")
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: "/add_despesa",
      routes: <String, WidgetBuilder>{
        '/homepage':(context) => const HomePage(),
        '/splash': (context) => const SplashSreen(rota: '/homepage'),
        '/add_despesa':(context) => const AddDespesa(),
      } 
       
    );
  }
}
