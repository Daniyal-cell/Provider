import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'CounterScreen/count_example.dart';
import 'ProgramScreen/example_one.dart';
import 'ProgramScreen/favouriteScreen.dart';
import 'ProviderScreen/example_provider.dart';
import 'ProviderScreen/count_provider.dart';
import 'ProviderScreen/favourite_provider.dart';
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
          ChangeNotifierProvider(
        create: (_)=>CountProvider(),
    ),
          ChangeNotifierProvider(
        create: (_)=>ExampleProvider(),
    ),
          ChangeNotifierProvider(
        create: (_)=>FavouriteProvider(),
    ),

        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavouriteScreen(),
      ),
    );
  }
}
