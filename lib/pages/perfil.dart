import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/user.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  late User _editedUser;

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
                GestureDetector(
                  child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: _editedUser.img == null ? const AssetImage("assets/images/perfil.png") as ImageProvider
                          : FileImage(File(_editedUser.img.toString())),
                      fit: BoxFit.cover,
                    ),
                  ),
                  ),
                  onTap: (){
                    ImagePicker().pickImage(source: ImageSource.gallery)
                        .then((file){
                          if(file == null) return;
                          setState(() {
                            _editedUser.img = file.path;
                          });
                    });
                  },
                )
              ],
            ),
          ),
          
          ),
    );
    
  }
}