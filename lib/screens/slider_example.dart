// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Slider Through Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              print("BUILD");
              return Slider(
                  min: 0.0,
                  max: 1.0,
                  value: provider.value,
                  onChanged: (val) {
                    provider.setValue(val);
                  });
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen.withOpacity(value.value)),
                      child: const Center(
                        child: Text(
                          "Container 1",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(value.value)),
                      child: const Center(
                        child: Text(
                          "Container 2",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
