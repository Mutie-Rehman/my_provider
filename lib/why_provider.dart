// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';

/*
The main reason for using the state management like provider is here in this screen that 
our whole screen is rebuilding after every 2 second which make an application to consume
more memory in ram and cause app to crash.
 */
class WhyProvider extends StatefulWidget {
  const WhyProvider({super.key});

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Timer.periodic(const Duration(seconds: 2), (timer) {
        count++;
        print(count);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Why Provider"),
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
        ],
      ),
    );
  }
}
