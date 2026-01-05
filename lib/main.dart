

import 'package:enterprise/app.dart';
import 'package:enterprise/core/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const App());
  // runZonedGuarded(() {}, (error, stackTrace) {
  //   log("run zoned guard error:$error");
  //   log("run zoned guard stack trace:$stackTrace");
  // });
}
