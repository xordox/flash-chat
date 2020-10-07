import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  @override
  void initState(){
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this);

    animation = ColorTween(begin: Colors.white, end: Colors.blue).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Hero(
                      tag:'logo',
                      child: Image.asset('assets/images/logo.png')),
                  height: 60.0,
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900,),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(
              color: Colors.lightBlue,
              title: 'Register',
              onPressed:(){
                Navigator.pushNamed(context, RegistrationScreen.id);
              } ,
            ),
          ],
        ),
      ),
    );
  }
}

