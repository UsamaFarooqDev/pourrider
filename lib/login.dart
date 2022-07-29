import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riderapp/phonelogin.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Image.asset("images/logo.png"),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Signup Or Login",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 255, 81, 0),
                    size: 40.0,
                  )),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => phonelogin()));
                  },
                  icon: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 86, 92, 90),
                    size: 40.0,
                  )),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.facebook,
                    color: Color.fromARGB(255, 7, 95, 196),
                    size: 40.0,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
