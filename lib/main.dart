import 'package:counter_with_provider/providers/theam_provider.dart';
import 'package:counter_with_provider/views/screens/theam_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'CounterScreen/count_example.dart';
import 'views/screens//example_one.dart';
import 'views/screens/favourite_screen.dart';
import 'providers/example_provider.dart';
import 'providers/count_provider.dart';
import 'providers/favourite_provider.dart';
//import 'CounterScreen/example_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => TheamProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeProvider = Provider.of<TheamProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode, // Controls theme mode
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: FavouriteScreen(),
          );
        },
      ),
    );
  }
}
