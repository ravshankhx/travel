import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:travel/database/places_db.dart';

import '../models/place.dart';

class PlaceProvider with ChangeNotifier {
  List<Place> _list = [];

  List<Place> get list {
    return [..._list];
  }

  void addPlace(String title, File image) {
    PlaceLocation placeLocation =
        PlaceLocation(latitude: '1', longitude: '1', address: 'Uzb');
    Place newPlace = Place(
      id: UniqueKey().toString(),
      title: title,
      location: placeLocation,
      image: image,
    );
    _list.add(newPlace);
    notifyListeners();
    PlacesDB.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> getPlaces() async {
    PlaceLocation placeLocation =
        PlaceLocation(latitude: '1', longitude: '1', address: 'Uzb');
    final placesList = await PlacesDB.getData('user_places');
    _list = placesList.map(
      (place) => Place(
        id: place['id'],
        title: place['title'],
        image: File(place['image']),
        location: placeLocation,
      ),
    ).toList();
    notifyListeners();
  }
}
