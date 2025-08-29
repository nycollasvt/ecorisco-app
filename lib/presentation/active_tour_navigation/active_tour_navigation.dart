import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/map_placeholder_widget.dart';
import './widgets/bottom_controls.dart';
import './widgets/guide_communication_panel.dart';
import './widgets/guide_proximity_indicator.dart';
import './widgets/tour_status_bar.dart';
import './widgets/turn_by_turn_directions.dart';
import './widgets/weather_alert_banner.dart';

class ActiveTourNavigation extends StatefulWidget {
  const ActiveTourNavigation({Key? key}) : super(key: key);

  @override
  State<ActiveTourNavigation> createState() => _ActiveTourNavigationState();
}

class _ActiveTourNavigationState extends State<ActiveTourNavigation> {
  Position? _currentPosition;

  // Mock data
  final Map<String, dynamic> _weatherAlert = {"type": "rain", "title": "Possibilidade de Chuva"};
  final Map<String, dynamic> _currentDirection = {"instruction": "Continue em frente", "distance": "150m"};

  @override
  void initState() {
    super.initState();
    // Simular a obtenção da localização
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _currentPosition = Position(latitude: -20.4697, longitude: -54.6201, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0, altitudeAccuracy: 0, headingAccuracy: 0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Mapa
          kMapaSimuladoAtivo
              ? const MapPlaceholderWidget()
              : _currentPosition != null
                  ? GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                        zoom: 16.0,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                    )
                  : const Center(child: CircularProgressIndicator()),

          // Widgets sobre o mapa
          SafeArea(
            child: Column(
              children: [
                WeatherAlertBanner(weatherAlert: _weatherAlert),
                TourStatusBar(),
                TurnByTurnDirections(currentDirection: _currentDirection),
                Spacer(),
                GuideProximityIndicator(),
                BottomControls(),
                GuideCommunicationPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}