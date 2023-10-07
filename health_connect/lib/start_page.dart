import 'package:flutter/material.dart';
import 'package:health_connect/type_of_user.dart';
import 'login_page.dart';
import 'register_page.dart';

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
      body: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    builder: (context) => const RegisterPage(),
                  ));
                },
                child: Text('Register'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implement the action for the emergency services button here
                  // You can navigate to a medical services screen or perform any desired action.
                },
                child: Text('Emergency Services'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
