import 'package:enterprise/core/constants/routes_constants.dart';
import 'package:enterprise/core/di/injection.dart';
import 'package:enterprise/core/router/app_router.dart' as AppRouter;
import 'package:enterprise/core/theme/bloc/theme_bloc.dart';
import 'package:enterprise/core/theme/bloc/theme_event.dart';
import 'package:enterprise/core/theme/bloc/theme_state.dart';
import 'package:enterprise/core/theme/domain/entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<ThemeBloc>()..add(LoadTheme()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'Enterprise',
            debugShowCheckedModeBanner: false,
            themeMode: themeState.themeMode == AppThemeMode.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
