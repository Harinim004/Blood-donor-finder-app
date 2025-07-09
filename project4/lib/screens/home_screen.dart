import 'package:flutter/material.dart';
import 'donor_list_screen.dart';
import 'sos_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blood Donor Finder")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DonorListScreen())),
              child: Text("Search Donors"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SOSScreen())),
              child: Text("Send SOS"),
            ),
          ],
        ),
      ),
    );
  }
}
