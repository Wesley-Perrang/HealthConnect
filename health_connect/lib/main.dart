import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'start_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyB-KPtqF9ghJ0UOIMhE5ESJr4izP_o6hzA",
      appId: "1:350049193182:android:483ca5fc2a60ef149fc64f",
      messagingSenderId: "350049193182",
      projectId: "healthconnect-1e773",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}
