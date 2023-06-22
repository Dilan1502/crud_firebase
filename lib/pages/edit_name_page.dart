import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({Key? key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    nameController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar '),
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
                backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2018/03/29/12/06/silhouette-3272088_1280.png'), // Reemplaza 'assets/images/avatar.png' con la ruta de tu imagen
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Actualice el nombre',
                ),
              ),
              Text(
                arguments['uid'],
                style: const TextStyle(fontSize: 10),
              ),
              ElevatedButton(
                onPressed: () async {
                  await updatePeople(arguments['uid'], nameController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Actualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
