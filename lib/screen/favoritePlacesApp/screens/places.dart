import 'package:flutter/material.dart';
import 'package:practice_ui/screen/favoritePlacesApp/providers/user_places.dart';
import 'package:practice_ui/screen/favoritePlacesApp/screens/add_place.dart';
import 'package:practice_ui/screen/favoritePlacesApp/widgets/place_list.dart';
import 'package:provider/provider.dart';

class PlacesSceen extends StatefulWidget {
  const PlacesSceen({super.key});

  @override
  State<PlacesSceen> createState() => _PlacesSceenState();
}

class _PlacesSceenState extends State<PlacesSceen> {
  late Future<void> _placeFuture;
  @override
  void initState() {
    super.initState();
    _placeFuture = context.read<UsserPlaceNotifier>().loadPlace();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = context.watch<UsserPlaceNotifier>().place;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddPlaceScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: _placeFuture,
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : PlacesList(
                      places: userPlaces,
                    );
            }),
      ),
    );
  }
}
