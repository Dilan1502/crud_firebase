import 'package:firebase/services/firebase_services.dart';
import 'package:flutter/material,dart';
import 'package:flutter/material.dart';
class 
addNamePage extends StatefulWidget {
  const 
  addNamePage({super.key});

  @override
  State<
  addNamePage> createState() => _
  addNamePageState();
}

class _
addNamePageState extends State<
addNamePage> {
  TextEditingController nameController = TextEditingController(text: "");



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Add Name'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        children: [
           TextField(
            controller: nameController,
            decoration: const  InputDecoration(
              hintText: 'Enter Name'
            ),
          )
          ElevateButton(
            onPressed: () async {
            await addPeople(nameController.text).then((_){
              Navigator.pop(context);
            }
            );
          }, child: const Text ('Guardar'))

        ],
      )
    );
  }
}
