import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/constants/color_constants.dart';
import 'package:movie_app/representation/authen/login_screen.dart';
import 'package:movie_app/representation/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen () async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
        color: ColorPalette.backgroundScaffoldColor
      ),
      child: Center(
        child: Text("Movie App", style: TextStyle(
          color: ColorPalette.textColor, 
          fontSize: 32
          
          ),),
      ),
    )
    );
  }
}