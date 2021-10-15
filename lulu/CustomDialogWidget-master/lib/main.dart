import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: ThemeData(), home: Page());
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: macros(MediaQuery.of(context).size.height * 0.20, MediaQuery.of(context).size.width, context),
      ),
    );
  }
}


class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: macros2(MediaQuery.of(context).size.height * 0.20, MediaQuery.of(context).size.width)
        ),
      ),
    );
  }
}

Widget macros(double height, double width, BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: InkWell(
        onTap: () {
          showDialog(
                context: context,
                builder: (_) => FunkyOverlay(),
              );
        },
        child: Material(
          color: Colors.white.withOpacity(1),
          elevation: 12.0,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: _column(
                    'Cuenta: 1-1-2-89',
                    '\$125.21',
                    height,
                  ),
                  flex: 9,
                  fit: FlexFit.loose),
              //linea y flecha
              Flexible(
                  child: Container(
                    height: height * 0.80,
                    width: 1.0,
                    color: Colors.blue,
                  ),
                  flex: 1,
                  fit: FlexFit.loose),
              Flexible(
                  child: Icon(
                    Icons.navigate_next, 
                    color: Colors.blue,
                  ),
                  flex: 1,
                  fit: FlexFit.loose),
            ],
          ),
        ),
      ),
    );
  }

  Widget macros2(double height, double width) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: Material(
          color: Colors.white.withOpacity(1),
          elevation: 12.0,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(24.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Flexible(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Cuenta: 1-1-2-89',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        flex: 1,
                        fit: FlexFit.loose,
                      ),
                      Flexible(
                        child: Text(
                          'Total: \$125.21',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        flex: 1,
                        fit: FlexFit.loose,
                      )
                    ]),
                flex: 1,
                fit: FlexFit.loose,
              ),
              SizedBox(
                height: 10.0,
              ),
              Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: _columnButtons('Realizar Suscripcion',
                              Icons.account_balance_wallet),
                          flex: 1,
                          fit: FlexFit.loose),
                      Flexible(
                          child: _columnButtons(
                              'Realizar Rescate', Icons.view_headline),
                          flex: 2,
                          fit: FlexFit.loose),
                      Flexible(
                          child: _columnButtons('Ver movimientos', Icons.more_vert),
                          flex: 1,
                          fit: FlexFit.loose),
                    ],
                  ),
                  fit: FlexFit.loose,
                  flex: 3),
            ],
          )),
    );
  }

  Widget _column(String titulo, String total, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Flexible(child: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),flex: 1, fit: FlexFit.loose),
        Flexible(
            child: _row('Total: ', total, height), flex: 1, fit: FlexFit.loose),
      ],
    );
  }

  Widget _columnButtons(String titulo, IconData icon) {
    return InkWell(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
              child: Icon(icon, color: Colors.blue),
              flex: 1,
              fit: FlexFit.loose),
          Flexible(
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              flex: 1,
              fit: FlexFit.loose),
        ],
      ));
  }
  Widget _row(String text1, String text2, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Text(text1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          flex: 4,
          fit: FlexFit.loose,
        ),
        Flexible(
          child: Text(text2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          flex: 6,
          fit: FlexFit.loose,
        ),
      ],
    );
  }