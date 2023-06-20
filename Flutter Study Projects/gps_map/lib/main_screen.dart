import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition? _intialCameraPosition;

  int _polylineCounter = 0;
  Set<Polyline> _polylines = {};
  LatLng? _prevPosition;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    final position = await _determinePosition();

    _intialCameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 18,
    );

    setState(() {});

    // 앱 실행 후 계속해서 변경되는 위치정보를 받아와서 map이 이동하도록
    const LocationSettings locationSettings = LocationSettings();
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      _polylineCounter++;
      final polylineId = PolylineId('$_polylineCounter');
      final Polyline polyline = Polyline(
        polylineId: polylineId,
        color: Colors.deepOrange,
        width: 3,
        points: [
          _prevPosition ?? _intialCameraPosition!.target,
          LatLng(position.latitude, position.longitude),
        ],
      );
      setState(() {
        _polylines.add(polyline);
        _prevPosition = LatLng(position.latitude, position.longitude);
      });

      // _moveCamera(position); // 카메라 이동
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _intialCameraPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _intialCameraPosition!,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              polylines: _polylines,
            ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          onPressed: _goToCurrentLocation,
          label: const Text('Current Location'),
          icon: const Icon(Icons.directions_walk),
        ),
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    final Position position = await Geolocator.getCurrentPosition();
    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 17,
    );
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> _moveCamera(Position position) async {
    final GoogleMapController controller = await _controller.future;
    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 17,
    );
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
