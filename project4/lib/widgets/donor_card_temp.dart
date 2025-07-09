import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorCard extends StatelessWidget {
  final Map donor;

  DonorCard({required this.donor});

  void _callDonor(String phone) {
    launchUrl(Uri.parse("tel:$phone"));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 6,
      child: ListTile(
        title: Text(donor['name']),
        subtitle: Text("${donor['bloodGroup']} | ${donor['city']}"),
        trailing: IconButton(
          icon: Icon(Icons.call, color: Colors.green),
          onPressed: () => _callDonor(donor['phone']),
        ),
      ),
    );
  }
}
