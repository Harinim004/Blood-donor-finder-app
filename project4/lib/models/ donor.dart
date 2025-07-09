class Donor {
  final String name;
  final String bloodGroup;
  final String city;
  final double lat;
  final double lng;
  final String phone;

  Donor({required this.name, required this.bloodGroup, required this.city, required this.lat, required this.lng, required this.phone});

  factory Donor.fromMap(Map data) {
    return Donor(
      name: data['name'],
      bloodGroup: data['bloodGroup'],
      city: data['city'],
      lat: data['lat']?.toDouble() ?? 0.0,
      lng: data['lng']?.toDouble() ?? 0.0,
      phone: data['phone'],
    );
  }
}