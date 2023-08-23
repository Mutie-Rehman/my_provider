import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/*
Basically this is the provider which handles the state. The context of provider is global
because the provider comes above the material app in the main screen.
What we do is to initialize the count in the provider or whatever type of provider we are
creating and then we create the getter for that.
After creating the getter we have to create the refrence of that provider class in where 
we want to use the provider. After making a refrence of this provider in the class where we
want to use this provider we can use the count value.
Whenever we call the setCount function it will notify and increment the value of counter.
And the value of counter become 1 rather than 0. and we can get the value 1 from the getter.
After that in the other screen we can use the setCount method by the refrence of the provider
which we have created and can increment the value of the counter. 
So what is going on in the count_example screen: The whole widget was rebuolding again till when 
we added the consumer widget. Consumer widget is used where we have to use the provider and to change
the value. And by using value we can get every variable in the provider CountProvider. So in the top
where we have created the refrence of provider in count_example we have used listen property which is 
used to rebuild the whole widget when it is true and when false it only rebuild the widget with consumer.
*/
class CountProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
