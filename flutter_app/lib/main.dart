import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/sensors/app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const App());
}