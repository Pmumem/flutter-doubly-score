import 'package:flutter/material.dart';
import './pages/register/game_select.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoublyScore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Doubly Score'),
      initialRoute: "/",
      routes: <String, WidgetBuilder> {
        "/": (BuildContext context) => new MyHomePage(title: 'Doubly Score'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text;

  @override
  void initState() {
    super.initState();

    _text = "対戦登録";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          padding:
              EdgeInsets.only(top: 20.0, right: 30.0, bottom: 20.0, left: 30.0),
          elevation: 3,
          child: Text(_text, style: TextStyle(fontSize: 24.0)),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
                settings: const RouteSettings(name: "/register/game_select"),
                builder: (context) {
                  return GameSelect(title: _text);
                },
                fullscreenDialog: true, 
                ),
          ),
        ),
      ),
    );
  }
}
