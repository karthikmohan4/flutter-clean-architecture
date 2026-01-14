import 'dart:async';
import 'dart:developer';
import 'package:enterprise/app.dart';
import 'package:enterprise/config/flavors.dart';
import 'package:enterprise/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  F.appFlavor = Flavor.dev;
  runZonedGuarded(
    () async {
     WidgetsFlutterBinding.ensureInitialized();
     await dotenv.load(fileName: ".env");
     await  initDependencies();
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
      };
      runApp(const App());
    },
    (error, stackTrace) {
      log("Dev error: $error");
      log("Dev Stack Trace: $stackTrace");
    },
  );
}
