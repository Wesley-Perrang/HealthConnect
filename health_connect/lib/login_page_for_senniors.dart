import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_connect/home_page_seniors.dart';
import 'package:health_connect/voice_command_for_senoirs.dart';

class LoginPageForSeniors extends StatefulWidget {
  const LoginPageForSeniors({Key? key}) : super(key: key);

  @override
  State<LoginPageForSeniors> createState() => _LoginPageForSeniorsState();
}

class _LoginPageForSeniorsState extends State<LoginPageForSeniors> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Login successful
        // You can navigate to the home screen or perform other actions here
        print('Login successful: ${userCredential.user!.uid}');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => VoiceCommandPageForSeniors(),
          ));
      } else {
        // Login failed
        // You can handle errors and display appropriate messages
        print('Login failed');
      }
    } catch (e) {
      // Handle any errors that occur during login
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
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
    home: LoginPageForSeniors(),
  ));
}
