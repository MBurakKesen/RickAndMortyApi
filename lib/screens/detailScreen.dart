import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String image;
  String? gender;
  String? species;
  String? status;

  DetailPage({Key? key,required this.image,this.species,this.status,this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Karakter Detayları"),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(image: NetworkImage(image)),
            Text(gender!),
            Text(species!),
            Text(status!),
          ],
        ),
      )
    );
  }
}
