import 'package:flutter/material.dart';
import 'package:onboarding_flutter_teste_app/core/localization/localization_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(45.521563, -122.677433);
  int _actualMarkerIndex = 0;
  List<Marker> _markers = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onBackCallback() {
    setState(() {
      if (_actualMarkerIndex > 0) {
        _actualMarkerIndex -= 1;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: _markers[_actualMarkerIndex].position,
              zoom: 11.0,
            ),
          ),
        );
      }
    });
  }

  void _onAddCallback(LatLng posicao) {
    setState(() {
      int quantidade = _markers.length + 1;
      final String id = "marker_$quantidade";

      _markers.add(
        Marker(
          markerId: MarkerId(id),
          position: posicao,
          infoWindow: const InfoWindow(title: "Localização Selecionada"),
        ),
      );

      _actualMarkerIndex = _markers.length - 1;
    });
  }

  void _onFowardCallback() {
    setState(() {
      if (_actualMarkerIndex < _markers.length - 1) {
        _actualMarkerIndex += 1;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: _markers[_actualMarkerIndex].position,
              zoom: 11,
            ),
          ),
        );
      }
    });
  }

  void _onRefreshCallback() {
    setState(() {
      _markers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(LocalizationUtil.appLocalization.mapTitle),
        elevation: 2,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers.toSet(),
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
            onCameraMove: (position) {
              _center = position.target;
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: _onBackCallback,
                  tooltip: 'Back',
                  backgroundColor: Colors.amber,
                  heroTag: "btn4",
                  child: const Icon(Icons.arrow_back),
                ),

                const SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () => _onAddCallback(_center),
                  tooltip: 'Increment',
                  backgroundColor: Colors.amber,
                  heroTag: "btn3",
                  child: const Icon(Icons.add),
                ),

                const SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: _onFowardCallback,
                  tooltip: 'Foward',
                  backgroundColor: Colors.amber,
                  heroTag: "btn2",
                  child: const Icon(Icons.arrow_forward),
                ),

                const SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: _onRefreshCallback,
                  tooltip: 'Refresh',
                  backgroundColor: Colors.amber,
                  heroTag: "btn1",
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
