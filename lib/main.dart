import 'dart:async';
import 'dart:developer';

import 'package:enterprise/app.dart';
import 'package:enterprise/core/bloc/bloc_observer.dart';
import 'package:enterprise/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      Bloc.observer = MyBlocObserver();
      await dotenv.load(fileName: '.env');
      await initDependencies();
      runApp(const App());
    },
    (error, stackTrace) {
      log("run zoned guard error:$error");
      log("run zoned guard stack trace:$stackTrace");
    },
  );
}
