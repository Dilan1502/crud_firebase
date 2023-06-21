


import 'package:flutter/material.dart';

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData){

            return ListView.builder(
            itemCount: snapshot.data.length
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index]['name']),
                onTap: (() async {
                  await Navigator.pushNamed(context, "/edit", arguments: {
                    "name": snapshot.data?[index]['name'],
                    "uid": snapshot.data?[index]['uid'],
                  });
                  setState(() {
                    
                  });
                }
                ),
              );
            },
          );

          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
        }
        ),
        FloatingActionButton: FloatingActionButton(
          onPressed: () {
            await Navigator.pushNamed(context, '/add');
            setState(() {
              
            });
          },
          child: const Icon(Icons.add),
        )
    );
  }
}