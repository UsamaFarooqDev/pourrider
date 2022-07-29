import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pinput/pinput.dart';
import 'package:riderapp/home.dart';

class otpscreen extends StatefulWidget {
  final String phonenumber;
  final String dcode;
  const otpscreen({Key? key, required this.phonenumber, required this.dcode})
      : super(key: key);

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String otp = "";
  var verificationID;
  bool sentcode = false;
  @override
  void initState() {
    // TODO: implement initState
    verifynumber();
    super.initState();
  }

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
                "Verification Code",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Please Enter Your OTP Verification Code"),
              SizedBox(
                height: 10.0,
              ),
              Text("Code Sent On " + widget.dcode + widget.phonenumber),
              SizedBox(
                height: 10.0,
              ),
              if (sentcode)
                Text(
                  "Code Send Please Check",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Color(0xff03989E),
                      fontWeight: FontWeight.bold),
                ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Pinput(
                  length: 6,
                  onCompleted: (pin) => {
                    otp = pin,
                  },
                ),
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
                onPressed: verifyOTP,
                child: Text("Verify"),
              )
            ],
          ),
        ),
      ),
    );
  }

  verifynumber() async {
    auth.verifyPhoneNumber(
      phoneNumber: widget.dcode + widget.phonenumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
        setState(() {
          sentcode = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);

    await auth.signInWithCredential(credential).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  homepage(number: widget.dcode + widget.phonenumber)));
    });
  }
}
