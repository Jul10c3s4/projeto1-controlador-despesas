import 'package:flutter/cupertino.dart';

const String despesaTable = "despesaTable";
const String idColumn = "idColumn";
const String descricaoColumn = "descricaoColumn";
const String valorColumn = "ValorColumn";
const String tipoDespColumn = "tipoDespColumn";
const String dataColumn = "dataColumn";
const String statusColumn = "statusColumn";


class Despesas {
  int? id;
  String? descricao;
  int? valor;
  String? tipoDesp;
  String? data;
  String? status;

  get dataText => this.data;
  Despesas();

  //O fromMap pega o mapa do banco de dados e tranforma no tipo Despesas
  Despesas.fromMap(Map<dynamic, dynamic> map)
  :id = map[idColumn],
  descricao = map[descricaoColumn],
  valor = map[valorColumn],
        tipoDesp = map[tipoDespColumn],
  data = map[dataColumn],
  status = map[statusColumn];

  //O toMap pega o widget Despesas e tranforma em um map e salva no banco de dados
  Map<String, dynamic> toMap()  {

    Map<String, dynamic> map = {

      descricaoColumn: descricao,
      valorColumn: valor,
      tipoDespColumn: tipoDesp,
      dataColumn: data,
      statusColumn: status
    };

    if(id!=null){
      map[idColumn] = id;
    }

      return map;
    }
  }


/*Despesas({
  required this.descricao,
  required this.valor,
  required this.data,
  required this.status,
});*/

