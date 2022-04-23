import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget { //gfgfgf
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.deepOrange,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text("data"),
            Text("data"),
          ]),
        ),
      ),
    );
  }
}
