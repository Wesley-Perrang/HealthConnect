import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_connect/login_page_provaders.dart';
import 'package:health_connect/otp_verification.dart';

class HealthcareProviderRegisterPage extends StatefulWidget {
  const HealthcareProviderRegisterPage({Key? key}) : super(key: key);

  @override
  State<HealthcareProviderRegisterPage> createState() =>
      _HealthcareProviderRegisterPageState();
}

class _HealthcareProviderRegisterPageState
    extends State<HealthcareProviderRegisterPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _licenseNumberController = TextEditingController(); // Add a field for license number
  TextEditingController _specializationController = TextEditingController(); // Add a field for specialization

  Future<void> _register() async {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String email = _emailController.text;
    final String username = _usernameController.text;
    final String phone = _phoneController.text;
    final String password = _passwordController.text;
    final String licenseNumber = _licenseNumberController.text; // Get the license number
    final String specialization = _specializationController.text; // Get the specialization

    try {
      // Step 1: Verify phone number
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Automatically signs in the user if verification is completed
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);

          // You can proceed with registration or navigate to another screen here
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
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Step 2: Navigate to OTP input screen
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => OtpVerificationPage(
              verificationId: verificationId,
            ),
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Code auto retrieval timed out');
        },
      );
    } catch (e) {
      // Handle any errors that occur during registration
      print('Error during registration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Healthcare Provider Registration'), // Update the title
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _licenseNumberController,
                decoration: InputDecoration(labelText: 'License Number'), // Add a field for license number
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _specializationController,
                decoration: InputDecoration(labelText: 'Specialization'), // Add a field for specialization
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: HealthcareProviderRegisterPage(), // Use the HealthcareProviderRegisterPage as the home page
  ));
}
