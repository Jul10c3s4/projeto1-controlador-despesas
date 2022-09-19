import 'package:controlador_despesas/domain/despesas.dart';
import 'package:controlador_despesas/domain/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DespesaHelper{
  static final DespesaHelper _instance = DespesaHelper.internal();

  factory DespesaHelper() => _instance;

  DespesaHelper.internal();

  Database? _db;

  //Verificando se o banco é nulo
Future<Database?> get db async {
  if(_db != null){
    return _db;
  }else{
    _db = await initDb();
    return _db;
  }
}

//inicia o nosso banco de dados
Future<Database> initDb() async{
  final datebasesPath = await getDatabasesPath();
  final path = join(datebasesPath , "despesas.db");

  // abre o banco
  return await openDatabase(path, version:1, onCreate: (Database db, int newVersion) async {

    //cria a tabela
  await db.execute(
    'CREATE TABLE $despesaTable($idColumn INTEGER PRYMARY KEY, $descricaoColumn TEXT, $valorColumn INTEGER, $tipoDespColumn TEXT, $dataColumn TEXT, $statusColumn TEXT)');
  await db.execute('CREATE TABLE $perfilTable($idPerfilColumn INTEGER PRYMARY KEY, $imgColumn TEXT, $nameColumn TEXT)');
  });
}

Future<Despesas> saveDespesa(Despesas despesas) async{
  Database? dbDespesa = await db;

  despesas.id = await dbDespesa?.insert(despesaTable, despesas.toMap());
  return despesas;

  /**/
}

Future<Despesas?> getDespesa(int id) async{
  Database? dbDespesa = await db;
  List<Map> maps = await dbDespesa!.query(despesaTable, columns: [idColumn, descricaoColumn, valorColumn, tipoDespColumn, dataColumn, statusColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);

  if(maps.isNotEmpty){
    return Despesas.fromMap(maps.first);
  }else{
    return null;
  }
}

  Future<int> deletaDespesa(int id) async{
  Database? dbDespesa = await db;
  return await dbDespesa!.delete(despesaTable, where: "$idColumn = ?", whereArgs: [id]);
}

  Future<int> updateDespesa(Despesas despesas) async{
  Database? dbDespesa = await db;
  return await dbDespesa!.update(despesaTable, despesas.toMap(), where: "$idColumn = ?", whereArgs: [despesas.id]);
}

Future<List<Despesas>> getAllDespesas() async{
  Database? dbDespesa = await db;
  List listMap = await dbDespesa!.rawQuery('SELECT * FROM $despesaTable');
  List<Despesas> lista = [];
  
  for (Map m in listMap){
    lista.add(Despesas.fromMap(m as Map<String, dynamic>));
  }

  return lista;
}

Future<int?> getNumber() async{
  Database? dbDespesa = await db;
  return Sqflite.firstIntValue(
    await dbDespesa!.rawQuery("SELECT COUNT(*) FROM $despesaTable")
  );
}

Future<int?> getNumberdevendo() async{
    Database? dbDespesa = await db;
    return Sqflite.firstIntValue(
        await dbDespesa!.rawQuery("SELECT COUNT(*) FROM $despesaTable")
    );
  }

  Future close() async{
    Database? dbDespesa = await db;
    dbDespesa!.close();
  }
}