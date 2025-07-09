import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../widgets/donor_card_temp.dart';




class DonorListScreen extends StatefulWidget {
  @override
  _DonorListScreenState createState() => _DonorListScreenState();
}

class _DonorListScreenState extends State<DonorListScreen> {
  String selectedGroup = "A+";
  final cityCtrl = TextEditingController();
  List donors = [];

  void _search() async {
    donors = await FirebaseService.searchDonors(cityCtrl.text, selectedGroup);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Find Donors")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: cityCtrl, decoration: InputDecoration(labelText: "City")),
          ),
          DropdownButton<String>(
            value: selectedGroup,
            items: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (val) => setState(() => selectedGroup = val!),
          ),
          ElevatedButton(onPressed: _search, child: Text("Search")),
          Expanded(
            child: ListView.builder(
              itemCount: donors.length,
                itemBuilder: (ctx, i) => DonorCard(donor: donors[i]),
                
            ),
          )
        ],
      ),
    );
  }
}
