import 'dart:developer';

import 'package:enterprise/core/theme/bloc/theme_bloc.dart';
import 'package:enterprise/core/theme/bloc/theme_event.dart';
import 'package:enterprise/core/theme/bloc/theme_state.dart';
import 'package:enterprise/core/theme/domain/entity/entity.dart';
import 'package:enterprise/l10n/app_localizations.dart';
import 'package:enterprise/l10n/bloc/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(l10!.helloFlutter),
            ),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Switch(
                value: AppThemeMode.dark == state.themeMode,
                onChanged: (value) {
                  log("dark: $value");

                  if (value) {
                    context.read<ThemeBloc>().add(
                      ChangeTheme(AppThemeMode.dark),
                    );
                  } else {
                    context.read<ThemeBloc>().add(
                      ChangeTheme(AppThemeMode.light),
                    );
                  }
                },
              );
            },
          ),
          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, state) {
              return DropdownMenu(
                onSelected: (value) => context.read<LocaleCubit>().changeLocale(Locale(value.toString())),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'en', label: "English"),
                  DropdownMenuEntry(value: 'es', label: "Spanish"),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
