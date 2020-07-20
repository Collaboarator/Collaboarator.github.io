import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mykeelive/routes/routedApp.dart';
import 'package:mykeelive/utilAndDataTypes/configuration.dart';

void main() async {
  GoogleMap.init('AIzaSyDNwCJxRQTDTO37ZyP9Blk5ztuXwtJjOL8');
  WidgetsFlutterBinding.ensureInitialized();
  var app = RoutedApp();
  runApp(Configuration(child:app));
}

