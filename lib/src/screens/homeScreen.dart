import 'package:flutter/material.dart';
import 'secondScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page route builder'),
      ),
      body: Container(
        child: Center(
          child: Container(
            color: Colors.grey,
            child: TextButton(
              child: Text(
                'go to 2nd screen',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    //MaterialPageRoute(builder: (context) {return SecondScreen();},)
                    PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                    return ScaleTransition(
                      alignment: Alignment.center,
                      child: child,
                      scale: animation,
                    );
                  },
                  transitionDuration: Duration(seconds: 2),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SecondScreen();
                  },
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
