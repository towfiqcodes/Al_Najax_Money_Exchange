import 'dart:async';

import 'package:al_najax_money_exchange/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomeScreen()
      )
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("asset/images/splash_bg.png"), fit: BoxFit.cover),
            ),
        child: Center(
       child:Column (
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
            child: new Image(image: AssetImage("asset/images/splash_logo.png"),
            height:  MediaQuery.of(context).size.height/3,
            width:   MediaQuery.of(context).size.height/3,)
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text( "Al Najax Money Exchange",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
       ),
         
        ),
      ),
    );
  }
}