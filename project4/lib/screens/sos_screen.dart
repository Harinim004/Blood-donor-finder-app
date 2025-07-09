import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SOSScreen extends StatelessWidget {
  void _sendSOS() {
    Fluttertoast.showToast(msg: "SOS alert sent to nearby donors!", gravity: ToastGravity.CENTER);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SOS Request")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _sendSOS,
          icon: Icon(Icons.warning, color: Colors.white),
          label: Text("Send Emergency SOS"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
    );
  }
}