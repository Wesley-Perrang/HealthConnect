import 'package:flutter/material.dart';
import 'package:health_connect/map_page.dart';
import 'package:health_connect/settings_page.dart';
import 'package:health_connect/user_page.dart';

class HomePageProvader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Hamburger menu icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the navigation drawer
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Search icon
            onPressed: () {
              // Implement your search functionality here
              // You can open a search page or show a search bar overlay
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, // Customize the drawer header background color
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white, // Customize the text color
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigate to the HomeScreen or your desired screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageProvader()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to the SettingsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('User'),
              onTap: () {
                // Navigate to the UserPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Your content goes here'),
            ),
          ),
          SizedBox(height: 40), // Add spacing between the content and the button
          ElevatedButton(
            onPressed: () {
              // Implement the action for the medical services button here
              // You can navigate to a medical services screen or perform any desired action.
            },
            child: Text('Medical Services'),
          ),
        ],
      ),
    );
  }
}


  void _navigateToMap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapPage(),
      ),
    );
  }

// Define SettingsPage and UserPage as separate StatelessWidget classes.
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page Content'),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Center(
        child: Text('User Page Content'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePageProvader(),
  ));
}
