import 'package:flutter/cupertino.dart';

class Despesas {
  String descricao;
  double valor;
  DateTime? data;
  bool status = false;

  get dateText => this.data;
  Despesas({
    required this.descricao,
    required this.valor,
    });
}
