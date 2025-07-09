import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static final DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("donors");

  /// Adds a new donor to the database
  static Future<void> addDonor({
    required String name,
    required String city,
    required String bloodGroup,
    required double lat,
    required double lng,
  }) async {
    await dbRef.push().set({
      'name': name,
      'city': city,
      'bloodGroup': bloodGroup,
      'lat': lat,
      'lng': lng,
      'phone': '9876543210' // Replace with dynamic auth phone if needed
    });
  }

  /// Searches for donors by city and blood group
  static Future<List<Map<String, dynamic>>> searchDonors(String city, String group) async {
    try {
      final DatabaseEvent event = await dbRef.once();
      final DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        return data.values
            .where((d) =>
        (d as Map)['city'].toString().toLowerCase() == city.toLowerCase() &&
            (d)['bloodGroup'] == group)
            .map((d) => Map<String, dynamic>.from(d))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching donors: $e");
      return [];
    }
  }
}
