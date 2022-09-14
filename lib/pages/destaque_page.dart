import 'package:controlador_despesas/domain/despesas.dart';
import 'package:controlador_despesas/pages/homepage.dart';
import 'package:controlador_despesas/pages/perfil.dart';
import 'package:controlador_despesas/widgets/card_despesas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'adicionardespesa.dart';

enum OrderOptions {orderaz, orderza}

class DestaquePage extends StatefulWidget {
  const DestaquePage({super.key});

  @override
  State<DestaquePage> createState() => _DestaquePageState();
}

class _DestaquePageState extends State<DestaquePage> {
  int indexselected = 0;

  List pages = [
    const HomePage(),
    const Perfil(),
  ];
  List<Despesas> despesas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF373737),
        centerTitle: true,
        title: Text(
          'Despesas',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
        ),
        actions: [
          //No PopupMenuButton cria-se botões com opções 
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
              const PopupMenuItem<OrderOptions>(
                value: OrderOptions.orderaz,
                child: Text("Ordenar de A-Z")),

            const PopupMenuItem<OrderOptions>(
                value: OrderOptions.orderza,
                child: Text("Ordenar de Z-A"))
            ],
            ),
        ],
      ),
      backgroundColor: const Color(0xFFF6D656),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pageAddDespesa();
        },
        backgroundColor: Color(0xFF373737),
        child: Icon(
          Icons.add,
          size: 20,
        ),
      ),
      body: pages[indexselected],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF373737),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFFF3D16A),
        currentIndex: indexselected,
        onTap: (index) {
          setState(() {
            indexselected = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'perfil',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Despesas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Estatíticas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Histórico',
            ),
          ],
      ),
    );
  }
  void _pageAddDespesa({Despesas? despesa}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddDespesa(despesa: despesa)));
  }
}
