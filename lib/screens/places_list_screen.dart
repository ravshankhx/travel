import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/place_provider.dart';
import 'package:travel/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel"),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future:  Provider.of<PlaceProvider>(context,listen: false).getPlaces(),
        builder: ( ctx, snapshot) {

          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Consumer<PlaceProvider>(
            builder: (ctx, placeProvider, child) {
              print(placeProvider.list.length);
              if (placeProvider.list.isNotEmpty) {
                return ListView.builder(
                    itemCount: placeProvider.list.length,
                    itemBuilder: (c, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(
                            placeProvider.list[index].image,
                          ),
                        ),
                        title: Text(placeProvider.list[index].title),
                      );
                    });
              } else {
                return child!;
              }
            },
            child: const Center(
              child: Text("Joylar mavjud emas, Iltimos,qo;shing"),
            ),
          );
        },
      ),
    );
  }
}
