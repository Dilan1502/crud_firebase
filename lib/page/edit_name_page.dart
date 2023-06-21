import 'package:firebase/services/firebase_services.dart';
import 'package:flutter/material,dart';
import 'package:flutter/material.dart';
class 
EditNamePage extends StatefulWidget {
  const 
  EditNamePage({super.key});

  @override
  State<
  EditNamePage> createState() => _
  EditNamePageState();
}

class _
EditNamePageState extends State<
EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");



  
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Edit Name'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        children: [
           TextField(
            controller: nameController,
            decoration: const  InputDecoration(
              hintText: 'ingrese la modificacion'
            ),
          )
          ElevateButton(
            onPressed: () async {
              await updatePeople(arguments['uid'], nameController.text).then((value) {
                Navigator.pop(context);
              }); 
          }, 
          child: const Text ('Actualizar'))

        ],
      )
    );
  }
}
