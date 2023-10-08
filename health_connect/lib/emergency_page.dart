import 'package:flutter/material.dart';
import 'voice_command_page.dart'; // Import the voice command page file

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  String selectedEmergencyType = 'Medical Emergency'; // Default emergency type
  List<String> emergencyTypes = [
    'Medical Emergency',
    'Heart Attack',
    'Stroke',
    'Allergic Reaction',
    'Injury',
    'Burn',
    'Seizure',
    'Diabetic Emergency',
    'Bleeding',
    'Motor Vehicle Accident',
    'Drowning',
    'Broken Bones',
    'Seizure',
    // Add more emergency types here
  ];

  List<String> filteredEmergencies = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEmergencies = List.from(emergencyTypes);
  }

  void filterEmergencies(String query) {
    query = query.toLowerCase();
    setState(() {
      filteredEmergencies = emergencyTypes
          .where((emergency) => emergency.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Services'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterEmergencies,
              decoration: InputDecoration(
                labelText: 'Search for an emergency',
                hintText: 'Type to search...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEmergencies.length,
              itemBuilder: (context, index) {
                final emergencyType = filteredEmergencies[index];
                return ListTile(
                  title: Text(emergencyType),
                  onTap: () {
                    setState(() {
                      selectedEmergencyType = emergencyType;
                    });
                    // You can add your logic to handle the selected emergency here
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle the action for sending a health-related emergency request here
              // You can access the selectedEmergencyType variable to determine the type.
              // For example, you can display a confirmation message based on the selected type.
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Health Emergency Request'),
                    content: Text('You are sending a $selectedEmergencyType emergency request.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Send Emergency Request'),
          ),
          SizedBox(height: 16.0),
          // Add the button to navigate to the VoiceCommandPage
          ElevatedButton(
            onPressed: () {
              // Navigate to the VoiceCommandPage when the button is pressed
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VoiceCommandPage(),
              ));
            },
            child: Text('Voice Command'),
          ),
        ],
      ),
    );
  }
}
