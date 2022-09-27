import 'package:controlador_despesas/domain/despesa_helper.dart';
import 'package:controlador_despesas/domain/despesas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EstatisticasPage extends StatefulWidget {
  const EstatisticasPage({super.key});

  @override
  State<EstatisticasPage> createState() => _EstatisticasPageState();
}

class _EstatisticasPageState extends State<EstatisticasPage> {
  List<Despesas> despesas = [];
  DespesaHelper helper = DespesaHelper();
  int valorPago = 0;
  int despPendentes = 0;
  int totalAPagar = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Estatísticas das Despesas",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF373737),
      ),
      backgroundColor: const Color(0xFFF6D656),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.monetization_on_rounded,
              color: Colors.amber,
              size: 40,),

              tileColor: Color(0xFFFFFAEF),
              title: Text(
                "Valor total à pagar: ",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("$totalAPagar"),
            )
          ],
        ),
      ),
    );
  }

  void _getDatas() {
    helper.getAllDespesas().then((list) {
      despesas = list;
      despesas.forEach((despesas) {
        totalAPagar = totalAPagar + despesas.valor!;
      });
    });
  }
}
