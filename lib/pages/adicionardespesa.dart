import 'package:flutter/material.dart';
import 'package:controlador_despesas/domain/despesas.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class AddDespesa extends StatefulWidget {

  const AddDespesa({Key? key}) : super(key: key);

  @override
  State<AddDespesa> createState() => _AddDespesaState();
}

class _AddDespesaState extends State<AddDespesa> {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Casa', 'Saúde', 'Educação',"Lazer", "Diversão"];
  late final Despesas despesas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adicionar Despesa",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w800),
          ),
        backgroundColor: Color(0xFF373737),
        centerTitle: true,
        ),
      backgroundColor: Color(0xFFF3D16A),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80,horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Descrição da Despesa: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),),
                  ],
                ),
                    SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFFFFAEF)
                      ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Conta de luz',
                      ),
                    )
                    ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tipo de Despesa: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),),
                    ValueListenableBuilder(
                        valueListenable: dropValue,
                        builder: (BuildContext context, String value, _){
                          return DropdownButton(
                            hint: Text('Despesas de casa',
                            style: TextStyle(
                              color: Colors.grey,
                            ),),
                            value: (value.isEmpty) ? null : value,
                            onChanged: (escolha) => dropValue.value = escolha.toString(),
                            items: dropOpcoes.map((opcao) => DropdownMenuItem(
                                value: opcao,
                                child: Text(opcao),
                            ),).toList(),
                          );
                        })
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Valor:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFFFFAEF)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Conta de luz',
                      ),
                    )
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text("Prazo da despesa: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),),
                    SizedBox(width: 40,),
                    IconButton(onPressed: () async{
                      despesas.data = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2024),
                        locale: Locale("pt", "BR"),
                      );
                    }, icon: Icon(Icons.date_range))

                  ],
                )


              ],
            )
          ],
        ),
      ),
    );
  }
}
