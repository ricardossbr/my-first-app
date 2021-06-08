import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

  int _people = 10;

  void _changePeople(int people){
    _people +=people;
  }

  runApp(MaterialApp(
      title: "My Fist app",
      home: Home()));
}

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "";

  void _changePeople(int people){
    setState(() {
       _people +=people;
       if(_people < 0 ){
         _infoText = "Mundo Invertido?";
       }else if(_people <= 10){
         _infoText = "Pode entrar!";
       } else{
         _infoText = "Restaurante lotado!";
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpeg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () {
                          _changePeople(1);
                        },
                        child: Text("+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),)
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () {
                          _changePeople(-1);
                        },
                        child: Text("-1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),)
                    )
                )
              ],
            ),
            Text(
              "$_infoText",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}

