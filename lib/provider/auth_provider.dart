import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

/*
What we have done is created a fuction called login function which accepts two strings.
There we have added try catch which is used for exception handling and in try we write
the code which we have to send to server. In that code we have added a url which we get
from the website which is used for the login.And in the body it accepts the email and the
password. So here we have used the api for the login. We also have to create a variable
for the loading and then have to get it.Then we have created the setLoading function 
for changing the value of loading. 
 */
class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String passwaord) async {
    setLoading(true);
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": passwaord,
      });
      if (response.statusCode == 200) {
        print("Successful");
        setLoading(false);
      } else {
        print("Failed");
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
