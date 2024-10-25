import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of< CountProvider>(context,listen: false);
    print("countProvider");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:  const Text(
          "Counter Program",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          return Text(value.count.toString(),style: const TextStyle(
            fontSize: 50,
          ),);
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          countProvider.setCount();
        },
        child: const Icon(Icons.add,size: 30,),
      ),
    );
  }
}
