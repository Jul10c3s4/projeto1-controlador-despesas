import 'package:controlador_despesas/domain/despesas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class CardDespesas extends StatefulWidget {
  final Despesas despesa;
  const CardDespesas({super.key, required this.despesa});

  @override
  State<CardDespesas> createState() => _CardDespesasState();
}

class _CardDespesasState extends State<CardDespesas> {
  Despesas get despesas => widget.despesa;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFAEF),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          despesas.descricao,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
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
                          "${despesas.valor}",
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
                              despesas.status = true;
                              print(despesas.data);
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
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}