import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pinput/pinput.dart';
import 'package:riderapp/otpphone.dart';

class phonelogin extends StatefulWidget {
  const phonelogin({Key? key}) : super(key: key);

  @override
  State<phonelogin> createState() => _phoneloginState();
}

class _phoneloginState extends State<phonelogin> {
  TextEditingController number = new TextEditingController();
  String countrycode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pour Rider"),
        centerTitle: true,
        backgroundColor: Color(0xff03989E),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Please Enter Your Phone Number",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100.0,
                    child: CountryCodePicker(
                      onChanged: (code) => {
                        countrycode = code.dialCode!,
                      },
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: number,
                      decoration: InputDecoration(
                        label: Text("Phone Number"),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff03989E), width: 1.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                color: Color(0xff03989E),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => otpscreen(
                              phonenumber: number.text, dcode: countrycode)));
                },
                child: Text("Get OTP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
