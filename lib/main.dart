import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:paraskevas/SecondRoute.dart';
import 'package:paraskevas/All.dart';
import 'colours.dart';

void main() => runApp(MaterialApp(
      home: Myapp(),
    ));

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Paraskevas-SoundBoard',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: PrimaryColor,
          fontFamily: 'RobotoMono',
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                width: 180.0,
              ),
              centerTitle: true,
            ),
            drawer: new Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Image.asset('assets/logo.png'),
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                    ),
                  ),
                  ListTile(
                    title: Text('Όλα'),
                    onTap: () {Navigator.of(context)
                          .push(_pageTransisionsSideMenu(All()));},
                  ),
                  Text(
                    'About',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  ExpandText(
                    'Έκδοση:  1.0.0\n\nΗ ανεπίσημη ΜΕΘΑΝΙΩΤΙΚΗ έκδοση του Παρασκευά.Φτιαγμένο από μεθανιώτη για μεθανιώτες.',
                    textAlign: TextAlign.justify,
                    maxLength: 1,
                    arrowSize: 35,
                    arrowColor: PrimaryColor,
                  ),
                  Text(
                    'Created by:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Manos Gouvrikos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ), 
                ],
              ),
            ),
            body: ListView(
                // This next line does the trick.
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(_pageTransisions(SecondRoute()));
                    },
                    textColor: Colors.white,
                    color: PrimaryColor,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Button1",
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    color: PrimaryColor,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Button2",
                    ),
                  ),
                ])));
  }


  Route _pageTransisions(page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }



  Route _pageTransisionsSideMenu(page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.5, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
