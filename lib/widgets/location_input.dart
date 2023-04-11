import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewLocationImage;

  
  Future<void> _getCurrentLocation()async{
    
   final locationData = await Location().getLocation();
   print(locationData.latitude);
   print(locationData.longitude);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: _previewLocationImage == null
              ? Text('Manzil tanlanmagean')
              : Image.network(_previewLocationImage!),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: Icon(Icons.location_on),
                label: Text("Mening manzili,")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text("Xaritani ochish")),
          ],
        )
      ],
    );
  }
}
