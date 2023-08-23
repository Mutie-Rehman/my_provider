import 'package:flutter/material.dart';
import 'package:my_provider/provider/auth_provider.dart';
import 'package:provider/provider.dart';

/*
In this screen what we are going to do is to make a login screen. We have made two 
controllers and those controllers save values respectively. Means if we input any
value in email then the value will be stored in emailController and same will be 
for the passwordController. And we have a login button here what we are going to do
is to send this email and password to the server for this we have added http package
to pubspec file. SO here we have created the refrence of the authProvider.
 */
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                authProvider.login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                // width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
                child: Center(
                    child: authProvider.loading
                        ? CircularProgressIndicator()
                        : Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
