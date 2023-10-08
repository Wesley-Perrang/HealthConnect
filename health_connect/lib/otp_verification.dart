import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_connect/login_page_provaders.dart';
// import 'package:firebase_phone_auth/firebase_phone_auth.dart';



class OtpVerificationPage extends StatefulWidget {
  final String verificationId;

  const OtpVerificationPage({Key? key, required this.verificationId})
      : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'OTP'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _verifyOtp,
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _verifyOtp() async {
    final String otp = _otpController.text;

    try {
      // Step 3: Sign in with the OTP
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        // Registration successful
        print('Registration successful: ${userCredential.user!.uid}');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
      } else {
        // Registration failed
        print('Registration failed');
      }
    } catch (e) {
      // Handle any errors that occur during OTP verification
      print('Error during OTP verification: $e');
    }
  }
}
