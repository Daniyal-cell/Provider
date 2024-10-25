import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theam_provider.dart'; // Make sure the path is correct

class TheamChanger extends StatefulWidget {
  const TheamChanger({super.key});

  @override
  State<TheamChanger> createState() => _TheamChangerState();
}

class _TheamChangerState extends State<TheamChanger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Theme Changer Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          Row(
            children: [
              Switch(
                value: context.watch<TheamProvider>().themeMode == ThemeMode.dark,
                onChanged: (value) {
                  context.read<TheamProvider>().setTheme(value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
        ],
      ),
      // Rest of your widget tree...
    );
  }
}
