import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mykeelive/utilAndDataTypes/configuration.dart';
import 'package:mykeelive/utilAndDataTypes/hexColor.dart';
import 'basePage.dart';

class MapPageState extends State<MapPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _key = GlobalKey<GoogleMapStateBase>();
  bool _darkMapStyle = true;
  String _mapStyle=darkMapStyle;

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: null,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: GoogleMap(
                key: _key,
                markers: {
                  Marker(GeoCoord(34.0469058, -118.3503948)),
                },
                initialZoom: 12,
                initialPosition: GeoCoord(34.0469058, -118.3503948),
                // Los Angeles, CA
                mapType: MapType.roadmap,
                mapStyle: _mapStyle,
                interactive: true,
                onTap: (coord) {},
                mobilePreferences: const MobileMapPreferences(
                  trafficEnabled: true,
                  zoomControlsEnabled: true,
                ),
                webPreferences: WebMapPreferences(
                  fullscreenControl: true,
                  zoomControl: true,
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: true ? 60 : 16,
              child: FloatingActionButton(
                onPressed: () {
                  if (_darkMapStyle) {
                    GoogleMap.of(_key).changeMapStyle(null);
                    _mapStyle = null;
                  } else {
                    GoogleMap.of(_key).changeMapStyle(darkMapStyle);
                    _mapStyle = darkMapStyle;
                  }

                  setState(() => _darkMapStyle = !_darkMapStyle);
                },
                backgroundColor: _darkMapStyle ? Colors.black : Colors.white,
                child: Icon(
                  _darkMapStyle ? Icons.wb_sunny : Icons.brightness_3,
                  color: _darkMapStyle ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
}

const darkMapStyle = r'''
[
    {
        "featureType": "all",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": 36
            },
            {
                "color": "#000000"
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#000000"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 17
            },
            {
                "weight": 1.2
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 29
            },
            {
                "weight": 0.2
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 18
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 19
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 17
            }
        ]
    }
]
''';

class MapPage extends BasePage {
  MapPage._(); // Intentionally private empty constructor. Must pass params.

  MapPage(String name, String path) : super(name: name, path: path);

  @override
  State<StatefulWidget> createState() => new MapPageState();
}
