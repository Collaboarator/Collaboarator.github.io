import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mykeelive/routes/routedApp.dart';
import 'package:mykeelive/utilAndDataTypes/configuration.dart';

void main() async {
  GoogleMap.init('AIzaSyAYEdXcl45F0Mmfx6kZs3ZGRwkRMA7f0hI');
  WidgetsFlutterBinding.ensureInitialized();
  var app = RoutedApp();
  runApp(Configuration(child:app));
}

