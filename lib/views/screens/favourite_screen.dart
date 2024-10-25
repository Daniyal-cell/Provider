import 'package:counter_with_provider/providers/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'like_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Favourite Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>LikeScreen(),
                      )
                  );
                }, icon: const Icon(Icons.add_shopping_cart_rounded,color: Colors.red,)),
               Consumer<FavouriteProvider>(
                   builder: (context, value, child){
                     return Text(value.selectedItem.length.toString(),style: const TextStyle(
                       fontSize: 20,
                       color: Colors.black,
                     ),);
                   }
               )
              ],
            )
          )
        ],
      ),
      body: Consumer<FavouriteProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                // Toggle favorite on tap
                value.selectedItem.contains(index)
                    ? value.removeItem(index)
                    : value.addItem(index);
              },
              title: Text("Item $index"),
              trailing: Icon(
                value.selectedItem.contains(index)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            );
          },
        );
      }),
    );
  }
}
