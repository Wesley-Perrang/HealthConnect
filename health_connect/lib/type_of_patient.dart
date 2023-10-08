import 'package:flutter/material.dart';
import 'package:health_connect/login_page_for_senniors.dart';
import 'login_page_provaders.dart'; // Import your login page here

class PatientTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Patient Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page when "Disabled Citizen" button is pressed
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('Disabled Citizen'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page when "Senior Citizen" button is pressed
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPageForSeniors(),
                  ),
                );
              },
              child: Text('Senior Citizen'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page when "Just Citizen" button is pressed
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text('Citizen'),
            ),
          ],
        ),
      ),
    );
  }
}
