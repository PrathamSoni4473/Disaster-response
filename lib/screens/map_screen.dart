import '../widgets/panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapScreen extends StatefulWidget {
  String name;
  String city;
  String state;
  String country;
  GoogleMapScreen({
    @required this.name,
    @required this.city,
    @required this.state,
    @required this.country,
  });
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController _controller;
  final LatLng _initialPosition = const LatLng(22.5448131, 88.3403691);
  final Location _location = Location();

  void _onMapCreated(GoogleMapController _cntrl) {
    _controller = _cntrl;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 18)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(153, 57, 85, 1),
        toolbarHeight: 75,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${widget.name}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Column(
              children: [
                const Icon(Icons.location_on),
                Text(
                  '${widget.city}',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _initialPosition, zoom: 10),
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),
          SlidingUpPanel(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            backdropEnabled: true,
            panelBuilder: (controller) => PanelWidget(controller: controller),
          )
        ],
      ),
    );
  }
}
