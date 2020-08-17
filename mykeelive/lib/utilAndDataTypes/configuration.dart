import 'dart:core';

import 'package:flutter/material.dart';

/// For Branding Later on we make styling/text/image links constants.
/// https://stackoverflow.com/questions/54069239/whats-the-best-practice-to-keep-all-the-constants-in-flutter
/// While there are no technical issues with static const, architecturally we want to do it differently.
/// Flutter tend to not have any global/static variables and use an InheritedWidget.
/// Which means you can write:
/// This has a bit more code than the static const, but offer many advantages:
///       Works with hot-reload
///       Easily testable and mockable
///       Can be replaced with something more dynamic than constants without rewriting the whole app.
///       But at the same time it:
///       Doesn't consume much more memory (the inherited widget is typically created once)
///       Is performant (Obtaining an InheritedWidget is O(1))
class Configuration extends InheritedWidget {

  ///  SET UP -- SHOULD NOT NEED TO CHANGE ///
  static Configuration of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<Configuration>();

  const Configuration({Widget child, Key key}): super(key: key, child: child);

  @override
  bool updateShouldNotify(Configuration oldWidget) => false;
  /// ----------------------------------- ///

  /// Defaults
  final String foregroundColorWhite = '#ffffff';
  final EdgeInsets marginLeft10Right10Top10Bottom40 = const EdgeInsets.only(top:10, left:10, right:10, bottom:40);
  final EdgeInsets marginTopN10Left50 = const EdgeInsets.only(top:-10, left:50);
  final EdgeInsets marginTop20 = const EdgeInsets.only(top:20.0);
  final EdgeInsets marginTop10 = const EdgeInsets.only(top:10.0);
  final EdgeInsets marginTop35 = const EdgeInsets.only(top:35.0);
  final EdgeInsets marginTop60 = const EdgeInsets.only(top:60.0);
  final EdgeInsets noMargin = const EdgeInsets.all(0);
  final EdgeInsets marginAll5 = const EdgeInsets.all(5);
  final EdgeInsets marginAll10 = const EdgeInsets.all(10);
  final EdgeInsets marginAll20 = const EdgeInsets.all(20);
  final EdgeInsets marginTop20Bottom45 = const EdgeInsets.only(top:20, bottom:45);
  final EdgeInsets marginBottom20 = const EdgeInsets.only(bottom:20.0);
  final EdgeInsets marginLeft20Bottom160 = const EdgeInsets.only(left:20, bottom:160.0);
  final EdgeInsets marginLeft50 = const EdgeInsets.only(left:50);
  final EdgeInsets marginRight20 = const EdgeInsets.only(right:20);
  final EdgeInsets marginLeft20Right20 = const EdgeInsets.only(left:20, right:20);
  final EdgeInsets marginLeft40Right20Top20Bottom20 = const EdgeInsets.only(left:40, right:20, top:20, bottom:20);
  final EdgeInsets marginLeft10Right10Top40 = const EdgeInsets.only(left:10, right:10, top:40);
  final EdgeInsets marginLeft10Right10 = const EdgeInsets.only(left:10, right:10);
  final EdgeInsets marginLeft20Top40Bottom40 = const EdgeInsets.only(left:20, top:40, bottom:40);
  final EdgeInsets marginLeft20Top20Bottom30 = const EdgeInsets.only(left:20, top:20, bottom:30);
  final EdgeInsets marginLeft20Right20Top10 = const EdgeInsets.only(left:20, right:20, top:10);
}