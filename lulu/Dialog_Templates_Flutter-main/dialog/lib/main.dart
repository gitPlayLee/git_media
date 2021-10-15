import 'package:flutter/material.dart';
import 'dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            child: IconButton(
                onPressed: () {
                  Widget body = Container(
                    color: Colors.white,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              iconSize: 80,
                              onPressed: () {},
                              icon: Icon(
                                Icons.alarm,
                                size: 80,
                              )),
                          Text('Body'),
                        ],
                      ),
                    ),
                  );
                  List<Widget> footer = [
                    Text('Footer'),
                    IconButton(onPressed: () {}, icon: Icon(Icons.alarm)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.alarm_add)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.alarm_off)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.alarm_on)),
                  ];
                  return dialogHeaderBodyFooter(
                      context,
                      Colors.blue,
                      Text(
                        'HEADER',
                        style: TextStyle(color: Colors.white),
                      ),
                      Colors.white,
                      body,
                      footer,
                      250,
                      350);
                },
                icon: Icon(Icons.alarm_add)),
          ),
        ],
      ),
    );
  }
}
