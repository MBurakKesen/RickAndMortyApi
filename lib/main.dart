import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_demo/services/seriveces.dart';

import 'models/Character.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Character> char = [];
  @override
  void initState() {
    Services.getValue();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Character>>(
          future: Services.getValue(),
          builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
            if (snapshot.hasData==true) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child:Image.network("${snapshot.data![index].image}") ),
                      title: Text("${snapshot.data![index].name}"),
                      trailing: Text("${snapshot.data![index].id}"),
                    ),
                  );
                },
              );
            }
            return Text("no data");
          },
        ),
      ),
    );
  }
}
