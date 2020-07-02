import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/app/router.gr.dart';
import 'package:bltCinemas/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.dark,
        splashColor: Colors.orange[600],
        scaffoldBackgroundColor: Color(0xFF121212),
        primaryColor: Color(0xFF121212),
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
          color: Color(0xFF262626),
        ),
        accentColor: Colors.orange[600].withOpacity(0.4),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange[600],
          splashColor: Colors.white24,
        ),
      ),
      initialRoute: Routes.homeViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
