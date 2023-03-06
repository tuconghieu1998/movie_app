import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/network/network_request.dart';
import 'package:movie_app/representation/common/button_widget.dart';
import 'package:movie_app/representation/main_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Log in",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 45,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              title: "Log in",
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              title: "Continue with Guest",
              onTap: () {
                NetworkRequest.getGuestSession().then((guestSessionId) {
                  if(guestSessionId != "") {
                    print("GuestID: $guestSessionId");
                    // TODO: save local guest session ID
                    // call API with id
                    Navigator.of(context).pushNamed(MainApp.routeName);
                  }
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Create a new account!")
          ],
        ),
      ),
    ));
  }
}
