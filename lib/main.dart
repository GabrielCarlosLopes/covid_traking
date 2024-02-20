import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/router/router.dart';
import '../../theme/theme.dart';
import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  GetIt.I<ValueNotifier<ThemeMode>>().value = ThemeMode.system;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GetIt.I<ValueNotifier<ThemeMode>>(),
        builder: (_, mode, __) {
          return MaterialApp.router(
            title: 'Covid traking',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: mode,
            routerConfig: router,
          );
        });
  }
}
