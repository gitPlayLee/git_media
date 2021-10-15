import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rows and Columns',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rows and Columns'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Row(
        // verticalDirection: VerticalDirection.up,
        // textDirection: TextDirection.rtl,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
          children: createSquares(5)
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [Colors.greenAccent, Colors.lightGreenAccent, Colors.lightGreen, Colors.green, Colors.grey];
    List<Widget> squares = <Widget>[];
    while (i < numSquares) {
      Expanded square = Expanded(
          flex: i,
          child: Container(
            color: colors[i],
            // width: 60,
            height: 60,
            child: Text(i.toString()),
          ) );
      i++;
      squares.add(square);
    }
    return squares;
  }
}