import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favourite_provider.dart';
class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<FavouriteProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.selectedItem.length,
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
