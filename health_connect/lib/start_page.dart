import 'package:flutter/material.dart';
import 'package:health_connect/type_of_register.dart';
import 'type_of_user.dart';
import 'login_page_provaders.dart';
import 'register_page.dart';
import 'emergency_page.dart'; // Import your emergency_page.dart

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String selectedLanguage = 'English'; // Default language selection

  // Define a list of languages available in South Africa
  List<String> languages = [
    'English',
    'Afrikaans',
    'Zulu',
    'Xhosa',
    'Sotho',
    'Tswana',
    'Northern Sotho',
    'Swazi',
    'Venda',
    'Tsonga',
    'Ndebele',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Health Connect'),
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/Caduceus.png', // Replace with the path to your image
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TypeOfUserPage(),
                    ));
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TypeRegistrationPage(),
                    ));
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EmergencyPage(), // Navigate to EmergencyPage
                    ));
                  },
                  child: Text('Emergency Services'),
                ),
                SizedBox(height: 16.0), // Add spacing between buttons and language dropdown
                // DropdownButton for language selection
                DropdownButton<String>(
                  value: selectedLanguage,
                  onChanged: (newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  items: languages.map((language) {
                    return DropdownMenuItem(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
