import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mykeelive/utilAndDataTypes/configuration.dart';
import 'package:mykeelive/utilAndDataTypes/hexColor.dart';
import 'basePage.dart';
import 'dart:js' as js;

class MapPageState extends State<MapPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _key = GlobalKey<GoogleMapStateBase>();
  bool _darkMapStyle = true;
  String _mapStyle = darkMapStyle;

  Widget getMapWithOrWithoutIgnorePointer() {
    if (Scaffold.of(context).isDrawerOpen) {
      return IgnorePointer(
        child: Stack(
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
              left: 16,
              child: FloatingActionButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                backgroundColor: _darkMapStyle ? Colors.black : Colors.white,
                child: Icon(
                  Icons.menu,
                  color: _darkMapStyle ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Stack(
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
          left: 16,
          child: FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            backgroundColor: _darkMapStyle ? Colors.black : Colors.white,
            child: Icon(
              Icons.menu,
              color: _darkMapStyle ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Configuration config = Configuration.of(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: null,
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: _darkMapStyle
                  ? HexColor.fromHex("#ffffff")
                  : HexColor.fromHex("#000000"),
            ),
            child: Drawer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          color: _darkMapStyle ? Colors.black : Colors.white,
                          child: Padding(
                              padding: config.marginLeft10Right10Top40,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (_darkMapStyle) {
                                          GoogleMap.of(_key)
                                              .changeMapStyle(lightMapStyle);
                                          _mapStyle = null;
                                        } else {
                                          GoogleMap.of(_key)
                                              .changeMapStyle(darkMapStyle);
                                          _mapStyle = darkMapStyle;
                                        }

                                        setState(() =>
                                            _darkMapStyle = !_darkMapStyle);
                                      },
                                      color: _darkMapStyle
                                          ? Colors.black
                                          : Colors.white,
                                      icon: Icon(
                                        _darkMapStyle
                                            ? Icons.wb_sunny
                                            : Icons.brightness_3,
                                        color: _darkMapStyle
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: _darkMapStyle
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ]))),
                      Row(children: [
                        widget.getNavDrawer(context, config, _darkMapStyle)
                      ])
                    ],
                  ),
                  Column(children: [
                    Padding(
                        padding: config.marginAll10,
                        child: GestureDetector(
                            onTap: () {
                              js.context.callMethod("open",
                                  ["https://www.collaboarator.com/privacy"]);
                            },
                            child: Row(
                              children: <Widget>[
                                Text("Privacy Policy",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .merge(TextStyle(
                                            color: _darkMapStyle
                                                ? Colors.black
                                                : Colors.white)))
                              ],
                            ))),
                    Padding(
                        padding: config.marginLeft10Right10Top10Bottom40,
                        child: Row(
                          children: <Widget>[
                            Text("Sign Out",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .merge(TextStyle(
                                        color: _darkMapStyle
                                            ? Colors.black
                                            : Colors.white))),
                            Icon(Icons.input,
                                color: _darkMapStyle
                                    ? Colors.black
                                    : Colors.white),
                          ],
                        ))
                  ])
                ]))),
        body:
            Builder(builder: (context) => getMapWithOrWithoutIgnorePointer()));
  }
}

const lightMapStyle = r'''
[
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#e9e9e9"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
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
                "color": "#ffffff"
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
                "color": "#ffffff"
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
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#dedede"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": 36
            },
            {
                "color": "#333333"
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f2f2f2"
            },
            {
                "lightness": 19
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fefefe"
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
                "color": "#fefefe"
            },
            {
                "lightness": 17
            },
            {
                "weight": 1.2
            }
        ]
    }
]
''';

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
