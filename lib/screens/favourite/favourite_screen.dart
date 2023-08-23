// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:my_provider/provider/favourite_provider.dart';
import 'package:my_provider/screens/favourite/favourite_items_screen.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider =
        Provider.of<FavouriteProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favourite App"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteItemsScreen()));
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text(
                        "Item $index",
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
