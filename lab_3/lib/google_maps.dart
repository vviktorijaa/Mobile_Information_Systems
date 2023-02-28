// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   static const LatLng _center = LatLng(37.77483, -122.41942);
//
//   final Set<Marker> _markers = {
//     const Marker(
//       markerId: MarkerId('san_francisco'),
//       position: _center,
//       infoWindow: InfoWindow(
//         title: 'San Francisco',
//         snippet: '5 Star Rating',
//       ),
//     ),
//   };
//
//   void _onMapCreated(GoogleMapController controller) {
//     controller.animateCamera(CameraUpdate.newLatLngZoom(_center, 13));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Maps Demo'),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: const CameraPosition(
//           target: _center,
//           zoom: 13,
//         ),
//         markers: _markers,
//       ),
//     );
//   }
// }