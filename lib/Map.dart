import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 

class MapsDemo extends StatefulWidget {
  MapsDemo() : super();
  final String title = "Maps Demo";
  @override 
  MapsDemoState createState() => MapsDemoState();
}
class MapsDemoState extends State<MapsDemo> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  // intialize the controller on Map Create
 _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
 
// Update the position on CameraMove
 _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }
  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(45.531563, -122.677433),
    tilt: 59.440,
    zoom: 11.0,
);
 
Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
}
  Widget button(Function function , IconData icon){
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize:  MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(icon, size: 36,),
      );
  }
  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a Title',
            snippet: 'This is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
 }
  @override 
  // TODO: implement widget
  Widget build(BuildContext context){
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title : Text(widget.title),
          backgroundColor: Colors.blue,
        ),
        body:Stack(
    children: <Widget>[
    GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
        ),
        mapType: _currentMapType,
        markers: _markers,
        onCameraMove: _onCameraMove,
),
  Padding(
    padding: EdgeInsets.all(16),
    child: Align(
      alignment : Alignment.topRight,
      child : Column(children: <Widget>[
        button(_onAddMarkerButtonPressed , Icons.add_location),
        SizedBox(
            height: 16.0,
        ),
        button(_goToPosition1, Icons.location_searching)
      
      ],)
    ),
  )
]
)
      )
    );
  }
}