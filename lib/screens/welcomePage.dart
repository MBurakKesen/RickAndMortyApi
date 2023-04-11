import "package:flutter/material.dart";

import '../main.dart';
import 'myApp.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RİCK AND MORTY APP"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Text("KARAKTERLERİ GÖSTER"),
                OutlinedButton(child:Text("Git"),
                  onPressed:(){setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CharsPage()));
                  });}),

            ],
          ),
        ),
    );
  }
}
