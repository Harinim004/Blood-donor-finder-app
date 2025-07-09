import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/firebase_service.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  String selectedGroup = "A+";
  Position? _position;

  void _getLocation() async {
    _position = await Geolocator.getCurrentPosition();
    setState(() {});
  }

  void _register() async {
    await FirebaseService.addDonor(
      name: nameCtrl.text,
      city: cityCtrl.text,
      bloodGroup: selectedGroup,
      lat: _position?.latitude ?? 0.0,
      lng: _position?.longitude ?? 0.0,
    );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register as Donor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: cityCtrl, decoration: InputDecoration(labelText: "City")),
            DropdownButton<String>(
              value: selectedGroup,
              items: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedGroup = val!),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
