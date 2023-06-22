import 'package:firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({Key? key}) : super(key: key);

  @override
  _AddNamePageState createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2018/03/29/12/06/silhouette-3272088_1280.png'), // Reemplaza 'assets/images/avatar.png' con la ruta de tu imagen
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Ingrese el nuevo nombre',
                ),
              ),
              SizedBox(height: 16), // Espacio vertical de 16 puntos
              ElevatedButton(
                onPressed: () async {
                  await addPeople(nameController.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
