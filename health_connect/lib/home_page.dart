import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Health Connect'),
      ),
      body: Container(
        // Set the background color here
        color: Colors.lightBlue, // Replace with your preferred color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ));
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
