import 'package:firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class PersonList extends StatefulWidget {
  const PersonList({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: FutureBuilder(
          future: getPeople(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                    onDismissed: (direction) async {
                      await deletePeople(snapshot.data?[index]['uid']);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "¿Está seguro de querer eliminar a ${snapshot.data?[index]['name']}?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  return Navigator.pop(
                                    context,
                                    false,
                                  );
                                },
                                child: const Text(
                                  "Cancelar",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  return Navigator.pop(
                                    context,
                                    true,
                                  );
                                },
                                child: const Text("Aceptar"),
                              ),
                            ],
                          );
                        },
                      );

                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    direction: DismissDirection.endToStart,
                    key: Key(snapshot.data?[index]['uid']),
                    child: ListTile(
                      tileColor: const Color.fromARGB(255, 131, 227, 134),
                      title: Text(
                        snapshot.data?[index]['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        await Navigator.pushNamed(context, '/edit',
                            arguments: {
                              'name': snapshot.data?[index]['name'],
                              'uid': snapshot.data?[index]['uid'],
                            });
                        setState(() {});
                      },
                    ),
                  );
                }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
