import 'package:flutter/material.dart';
import 'package:login_screen/constants.dart';
import 'package:login_screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroudColor,
        textTheme: TextTheme(
          display1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            color: kPrimaryColor,
          ),
          headline: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.15),
            ),
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/person.jpeg'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'LIÇÕES DE COZINHA\n',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      TextSpan(
                          text: 'Maestria na arte da cozinha',
                          style: Theme.of(context).textTheme.headline)
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 25.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 26.0,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: kPrimaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'COMECE A APRENDER',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
