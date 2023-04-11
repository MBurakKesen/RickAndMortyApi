
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Character.dart';
import '../services/seriveces.dart';
import 'detailScreen.dart';

class CharsPage extends StatefulWidget {
  const CharsPage({Key? key}) : super(key: key);

  @override
  State<CharsPage> createState() => _CharsPageState();
}

class _CharsPageState extends State<CharsPage> {
  List<Character> char = [];
  @override
  void initState() {
    Services.getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Rick and Morty Karakterleri"),
          centerTitle: true,
        ),
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
                      trailing: CircleAvatar(child:Image.network("${snapshot.data![index].image}") ),
                      title: Text("${snapshot.data![index].name}"),
                      leading: Text("${snapshot.data![index].id}"),
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(image:"${snapshot.data![index].image}",gender:"${snapshot.data![index].gender}",species: "${snapshot.data![index].species}",status: "${snapshot.data![index].status}",)));
                      },
                    ),
                  );
                },
              );
            }
            return Text("no data");
          },
        ),
    );
  }
}
