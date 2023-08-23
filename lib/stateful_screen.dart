// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
/*
So here we have stateful widget and what we are doing in this is incrementing the counter 
by using the set state method. But here we can see that we we are incrementing the counter the
whole widget is build again and it set the state so we can change the state by this but 
there some problems that when we have many widgets instead of one counter and when we have
to deal with the large apps it consumes so much memory in the ram and can cause the app
to crash. So we presfer using the state management processes like provider to do so.
*/

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stateful Practice"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                count = 0;
                print(count);
              });
            },
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
            print(count);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
