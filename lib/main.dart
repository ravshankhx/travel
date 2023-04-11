import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/place_provider.dart';
import 'package:travel/screens/add_place_screen.dart';
import 'package:travel/screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PlaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routes: {
          AddPlaceScreen.routeName:  ( ctx ) => const AddPlaceScreen(),

        },
        home: PlacesListScreen(),
      ),
    );
  }
}
