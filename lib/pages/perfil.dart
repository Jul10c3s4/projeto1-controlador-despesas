import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tela de Perfil',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 25, 
            fontWeight: FontWeight.w800),
          ),
          leading: IconButton(onPressed: (){
          Navigator.pushReplacementNamed(context, '/homepage');
        }, icon: Icon(Icons.arrow_back)),
          backgroundColor: Color(0xFF373737),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/perfil.png"),
                      fit: BoxFit.cover,
                    )
                  ),
                )
              ],
            ),
          ),
          
          ),
    );
    
  }
}