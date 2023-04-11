import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/widgets/location_input.dart';

import '../providers/place_provider.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  static const String routeName = 'add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File? _savedImage;
  String _title = "";
  final _formKey = GlobalKey<FormState>();

  void _takeSavedImage(savedImage) {
    _savedImage = savedImage;
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _savedImage != null) {
      _formKey.currentState!.save();
      Provider.of<PlaceProvider>(context, listen: false)
          .addPlace(_title, _savedImage!);

      Navigator.of(context).pop();
    }

    print(_savedImage);
    print(_title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add travel Location"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Iltimos joy nomini kiriting";
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            _title = value!;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "Joy Nomi",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ImageInput(_takeSavedImage),
                      SizedBox(
                        height: 20,
                      ),
                      const LocationInput()
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            onPressed: _submit,
            child: Text("qo'shish"),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
