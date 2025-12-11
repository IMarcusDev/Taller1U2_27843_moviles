import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:pry_app_widget/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HomeWidget.setAppGroupId('group.mywidget'); // iOS
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpdateWidgetScreen(),
    );
  }
}
