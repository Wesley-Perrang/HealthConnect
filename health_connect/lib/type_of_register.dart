import 'package:flutter/material.dart';
import 'package:health_connect/provider_register.dart';
import 'package:health_connect/register_page.dart';

class PatientRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Registration'),
      ),
      body: Center(
        child: Text('Patient Registration Page Content'),
      ),
    );
  }
}

class HealthcareProviderRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare Provider Registration'),
      ),
      body: Center(
        child: Text('Healthcare Provider Registration Page Content'),
      ),
    );
  }
}

class TypeRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose your registration type:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Patient Registration Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text('Patient'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Healthcare Provider Registration Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealthcareProviderRegisterPage(),
                  ),
                );
              },
              child: Text('Healthcare Provider'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TypeRegistrationPage(),
  ));
}
