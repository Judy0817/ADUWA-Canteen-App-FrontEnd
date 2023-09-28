import 'dart:async';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:search_map_location/search_map_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}


class _MapState extends State<Map> {
  GoogleMapController? mapController; //contrller for Google map
  Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  Set<Marker> markers = Set(); //markers for google map
  LatLng showLocation = LatLng(6.853001341256969, 79.90359532519953);

  //location to show in map
  Widget searchLocation(){
    return Scaffold(
        body: Center(
          child: SearchMapPlaceWidget(
            apiKey: 'AIzaSyBvWI36tQ8jaJI-kqRFQ63j0e4aGlv_kLs',
            // The language of the autocompletion
            language: 'en',
            // The position used to give better recomendations. In this case we are using the user position
            //location: userPosition.coordinates,
            radius: 30000,
            onSelected: (Place place) async {
              final geolocation = await place.geolocation;

              // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
              final GoogleMapController controller = await _mapController.future;
              //controller.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));
              //controller.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
            },
          ),
        )
    );
  }

  @override
  void initState() {
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    //you can add more markers here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          )
        ],
        backgroundColor: Color(0xFF43073c),
      ),
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true,
        //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: showLocation, //initial position
          zoom: 10.0, //initial zoom level
        ),
        markers: markers,
        //markers to show on map
        mapType: MapType.normal,
        //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          mapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));

          setState(() {});
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history,),
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition();

  return position;
}
