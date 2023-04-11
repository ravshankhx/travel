import 'dart:io';

class PlaceLocation {
  final String latitude; // y o'qi
  final String longitude; // x o'qi
  final String address;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;

  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
