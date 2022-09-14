import 'package:flutter/cupertino.dart';

const String ContactTable = "contactTable";
const String idColumn = "idColumn";
const String descricaoColumn = "descricaoColumn";
const String valorColumn = "ValorColumn";
const String dataColumn = "dataColumn";
const String statusColumn = "statusColumn";
const String tipoDespColumn = "tipoDespColumn";

class Despesas {
  int? id;
  String? descricao;
  double? valor;
  String? tipoDesp;
  DateTime? data;
  bool? status = false;

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
  Map<dynamic, dynamic> toMap()  {

    Map<dynamic, dynamic> map = {

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

