import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';


/*
final userPositionProvider = FutureProvider<LatLng>((ref) async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  final origin = LatLng(position.latitude, position.longitude);

  return origin;
});
*/
/*
final kitPositionProvider = StreamProvider<LatLng>((ref) async* {
final kitData =  FirebaseDatabase.instance
      .ref()
      .child("1515157")
      .child("positionKit")
      .onValue;
 DataSnapshot kitPosition = kitData.;
        double latitude = kitPosition.child("lattude").value as double;
        double longitude = kitPosition.child("longitude").value as double;

        LatLng kitLatLng = LatLng(latitude, longitude);

        yield* kitLatLng;
      
});
*/

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
 // CameraPosition? _initialCameraPosition;
  late LatLng userPosition;
  // late LatLng kitPosition;

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  late GoogleMapController _googleMapController;

  Future<Polyline> getPolylines(LatLng origin, LatLng kitPosition) async {
    PolylinePoints polylinePoints = PolylinePoints();
    String googleAPiKey = "AIzaSyDl4V6yu8c1rqhycuN8vgrE7scmKeKSp8U";

    ///   Map<PolylineId, Polyline> polylines = {};

    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(kitPosition.latitude, kitPosition.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      debugPrint(result.errorMessage);
    }

    PolylineId id =
        PolylineId("${origin.toString()} to ${kitPosition.toString()}");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.green,
      points: polylineCoordinates,
      width: 8,
    );
    return polyline;
  }

  _initializeOrigin() async {
    //   LocationPermission permission = await Geolocator.checkPermission();

    LocationPermission permissionn = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // final futureUserPosition = ref.watch(userPositionProvider);

    /*   final uPosition = futureUserPosition.when(
      data: (data) => data,
      error: (error, stackTrace) => const LatLng(.0, .0),
      loading: () => const LatLng(.0, .0),
    );*/

    //  final futureKitPosition = ref.watch(kitPositionProvider);
/*
    final kPosition = futureKitPosition.when(
      data: (data) {
        DataSnapshot kitPosition = data.snapshot;
        double latitude = kitPosition.child("lattude").value as double;
        double longitude = kitPosition.child("longitude").value as double;

        LatLng kitLatLng = LatLng(latitude, longitude);

        return kitLatLng;
      },
      error: (error, stackTrace) => LatLng(.0, .0),
      loading: () => LatLng(.0, .0),
    );
*/
    //   final userKitPolyline = await getPolylines(uPosition, kPosition);

    setState(() {
      userPosition = LatLng(position.latitude, position.longitude);
      //   kitPosition = kPosition;
      markers.add(Marker(
        markerId: MarkerId(userPosition.toString()),
        infoWindow: InfoWindow(title: "Votre position0"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: userPosition,
      ));
      /*     markers.add(Marker(
        markerId: MarkerId(kitPosition.toString()),
        infoWindow: InfoWindow(title: kitPosition.toString()),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: kitPosition,
      ));*/
      _initialCameraPosition = CameraPosition(target: userPosition, zoom: 19);
      //   polylines.add(userKitPolyline);
    });
  }

  @override
  void initState() {
    _initializeOrigin();
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  final userPosition = ref.watch(userPositionProvider);
    //  final kitPosition = ref.watch(kitPositionProvider);
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseDatabase.instance
            .ref()
            .child("1515157")
            .child("positionKit")
            .onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Scaffold(
                body: Center(
                  child: Text("Données  == null"),
                ),
              );
            } else {
              DataSnapshot kitPosition = snapshot.data!.snapshot;
              double latitude = kitPosition.child("lattude").value as double;
              double longitude = kitPosition.child("longitude").value as double;

              LatLng kitLatLng = LatLng(latitude, longitude);

              final kitMarker = Marker(
                markerId: MarkerId(
                  kitLatLng.toString(),
                ),
                infoWindow: InfoWindow(title: "Votre moto"),
                position: kitLatLng,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange),
              );

              return Scaffold(
                body: GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: true,
                  mapToolbarEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: kitLatLng,
                    zoom: 18,
                  ),
                  onMapCreated: (controller) {
                    _googleMapController = controller;
                  },
                  markers: {...markers, kitMarker},
                  polylines: polylines,
                  //    onLongPress: _addMarker,
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  onPressed: () async {
                    final userToKitPolyline =
                        await getPolylines(userPosition, kitLatLng);

                    setState(() {
                      //polylines.clear();
                      polylines.add(userToKitPolyline);
                    });
                  },
                  child: const Icon(Icons.center_focus_strong),
                ),
              );
            }
          }
          return Scaffold(
            body: const Center(
              child: Text("Erreur d'obtention des données"),
            ),
          );
        },
      ),

/*
    */
    );
  }

  void _addMarker(LatLng pos) async {
    // Origin is not set OR Origin/Destination are both set
    // Set origin
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(pos.toString()),
        infoWindow: InfoWindow(title: pos.toString()),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      ));
      // Reset destination
    });

    /*
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });
    */
  }
}
