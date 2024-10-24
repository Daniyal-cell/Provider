import 'package:counter_with_provider/ProviderScreen/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              title: Text("Item " + index.toString()),
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
