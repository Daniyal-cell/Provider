import 'package:counter_with_provider/ProviderScreen/example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleProvider>(context, listen: false);
     print("_Checker");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Multi Provider Example",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Consumer<ExampleProvider>(builder: (context,value,child){
           return Slider(
             max: 1,
             min: 0,
             value: value.value, // Get the value from the provider
             onChanged: (val) {
               value.setValue(val); // Set the value using the provider's method
             },
           );
         }),
         Consumer<ExampleProvider>(builder: (context,value,child){
           return  Row(
             children: [
               Expanded(
                 child: Container(
                   height: 100,
                   decoration: BoxDecoration(
                     color: Colors.lightBlue.withOpacity(value.value), // Use provider value for opacity
                   ),
                   child: const Center(child: Text("Container One")),
                 ),
               ),
               Expanded(
                 child: Container(
                   height: 100,
                   decoration: BoxDecoration(
                     color: Colors.red.withOpacity(value.value), // Use provider value for opacity
                   ),
                   child: const Center(child: Text("Container Two")),
                 ),
               ),
             ],
           );
         }),


        ],
      ),
    );
  }
}
