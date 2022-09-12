import 'package:controlador_despesas/domain/despesas.dart';
import 'package:controlador_despesas/widgets/card_despesas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexselected = 0;

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
      ),
      backgroundColor: const Color(0xFFF6D656),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF373737),
        child: Icon(
          Icons.add,
          size: 20,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      // Aqui serão adicionados as despesas por meio do listview.builder
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
            icon: Icon(Icons.library_books),
            label: 'Home',
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
}
