import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:mykeelive/pages/mapPage.dart';

class RoutedApp extends MaterialApp {

  factory RoutedApp() {
    var knownRoutes = {
      '/map': (context) => MapPage('map', '/map'),
    };
    return new RoutedApp._(knownRoutes);
  }

  RoutedApp._(Map routes)
      : super(
      initialRoute: '/map',
      routes: routes,
      debugShowCheckedModeBanner: false);
}