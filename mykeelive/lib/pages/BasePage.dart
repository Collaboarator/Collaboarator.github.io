import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget{
  final String name;
  final String path;

  _BasePage(); // Intentionally private empty constructor. Must pass params.

  BasePage({Key key, this.name, this.path}):super(key:key);
}