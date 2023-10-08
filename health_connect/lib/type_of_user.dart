import 'package:flutter/material.dart';
import 'package:health_connect/type_of_patient.dart';
import 'login_page_provaders.dart';

class TypeOfUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select User Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page for Patients
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PatientTypePage(),
                  ),
                );
              },
              child: Text('Patient'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page for Healthcare Providers
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
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
