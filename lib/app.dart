import 'package:enterprise/core/di/injection.dart';
import 'package:enterprise/core/router/app_router.dart' as app_router;
import 'package:enterprise/core/theme/app_theme.dart';
import 'package:enterprise/core/theme/bloc/theme_bloc.dart';
import 'package:enterprise/core/theme/bloc/theme_event.dart';
import 'package:enterprise/core/theme/bloc/theme_state.dart';
import 'package:enterprise/core/theme/domain/entity/entity.dart';
import 'package:enterprise/l10n/app_localizations.dart';
import 'package:enterprise/l10n/bloc/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        BlocProvider(
          create: (_) => serviceLocator<LocaleCubit>()..loadLocale(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, localeState) {
              return MaterialApp.router(
                title: 'Enterprise',
                debugShowCheckedModeBanner: false,          
                darkTheme: AppTheme.darkTheme,
                theme: AppTheme.lightTheme,
                locale: localeState,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [Locale('en'), Locale('es')],
                themeMode: (themeState.themeMode == AppThemeMode.dark)
                    ? ThemeMode.dark
                    : ThemeMode.light,
                routerConfig: app_router.router,
              );
            },
          );
        },
      ),
    );
  }
}
