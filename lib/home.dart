import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homepage extends StatefulWidget {
  final String number;
  const homepage({Key? key, required this.number}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pour Rider"),
        centerTitle: true,
        backgroundColor: Color(0xff03989E),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Welcome " + widget.number,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
