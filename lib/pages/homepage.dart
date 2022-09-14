import 'package:flutter/material.dart';
import 'package:controlador_despesas/domain/despesas.dart';
import 'package:controlador_despesas/pages/homepage.dart';
import 'package:controlador_despesas/pages/perfil.dart';
import 'package:controlador_despesas/widgets/card_despesas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'adicionardespesa.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<Despesas> despesas = [];

  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      itemCount: despesas.length,
      itemBuilder: (context, index){
        return _despesaCard(context, index);
      },
    );
  }

  Widget _despesaCard(BuildContext context, int index){
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFFFFAEF),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //descrição
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${despesas[index].descricao ?? ""}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                //Data
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Prazo: ',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),),
                    SizedBox(width: 10,),
                    Text(
                      '${DateFormat('dd/MM/yyyy').format(despesas[index].dataText)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                //valor
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Valor: ',
                      style: TextStyle(
                          fontSize: 20
                      ),),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${despesas[index].valor ?? ""}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat('dd/MM/yyyy').format(despesas.dateText)),
                      ],
                    ),*/
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          despesas[index].status = true;
                        });
                      },
                      child: const Text(
                        'Pagar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
