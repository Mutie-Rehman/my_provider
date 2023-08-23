// ignore_for_file: must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';

/*
So in this example we will see that how we can convert our stateless widget to a
Statelful widget. Here we have a valueNotifier in provider which accepts the datatype
and we initialize that and then we define that and give a initial value and datatype.
ValueNotifier basically extends ChangeNotifier and implements ValueListenable widgets.
When we print the counter we can see that the counter is incrementing so we can see that
by using the valueNotifier we can change the variable in the stateless widgets.
Same is the case we have used in this screen which i the paswoord textformfield.
 */
class ValueNotifyScreen extends StatelessWidget {
  ValueNotifyScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Value Notifier"),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toogle,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: toogle.value,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                          onTap: () {
                            toogle.value = !toogle.value;
                          },
                          child: Icon(toogle.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                  ),
                );
              }),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    _counter.value.toString(),
                    style: const TextStyle(fontSize: 30),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
