import 'dart:async';
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:enterprise/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const App());
    },
    (error, stackTrace) {
      log("run zoned guard error:$error");
      log("run zoned guard stack trace:$stackTrace");
    },
  );
}

