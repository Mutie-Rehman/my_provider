// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:my_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteItemsScreen extends StatefulWidget {
  const FavouriteItemsScreen({super.key});

  @override
  State<FavouriteItemsScreen> createState() => _FavouriteItemsScreenState();
}

class _FavouriteItemsScreenState extends State<FavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider =
        Provider.of<FavouriteProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favourite Items"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
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
