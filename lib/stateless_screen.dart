// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';

/*
So this is the example of the stateless widget in which we are building the whole sceen
including all the widgets when we reload it. It does not changing its state in the UI but
we can see that the value of x is changing in the console so this is the main working of the
stateless widget.
*/
class StatelessScreen extends StatelessWidget {
  StatelessScreen({super.key});
  late int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Provider Practice"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              x.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          print(x);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
