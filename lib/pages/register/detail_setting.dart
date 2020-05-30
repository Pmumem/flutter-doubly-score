import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './params_display.dart';

class DetailSetting extends StatefulWidget {
  DetailSetting({Key key, this.title, this.params}) : super(key: key);

  final String title;
  var params;

  @override
  _DetailSettingState createState() => _DetailSettingState();
}

class _DetailSettingState extends State<DetailSetting> {
  final TextStyle _textStyle = TextStyle(fontSize: 24.0);
  final EdgeInsets _buttonPadding =
      EdgeInsets.only(top: 20.0, right: 40.0, bottom: 20.0, left: 40.0);

  List<bool> _toggleValues = List.generate(3, (_) => false);
  var _controllers = List.generate(2, (_) => new TextEditingController());

  @override
  void initState() {
    super.initState();

    _controllers[0].text = "10000";
    _controllers[1].text = "10000";

    widget.params['tobi'] = _toggleValues[0];
    widget.params['yakitori'] = _toggleValues[1];
    widget.params['debt'] = _toggleValues[2];

    widget.params['tobiPt'] = int.parse(_controllers[0].text);
    widget.params['yakitoriPt'] = int.parse(_controllers[1].text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: FlatButton(
          child: Icon(Icons.close, color: Colors.white),
          onPressed: () =>
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Flexible>[
            Flexible(
              flex: 1,
              child: Text("ルールを設定してください", style: _textStyle),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Row>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Text("トビ", style: _textStyle),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          height: 40.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: _toggleValues[0]
                                ? Colors.greenAccent[100]
                                : Colors.redAccent[100].withOpacity(0.5),
                          ),
                          child: Stack(
                            children: <Widget>[
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeIn,
                                top: 3.0,
                                left: _toggleValues[0] ? 30.0 : 0.0,
                                right: _toggleValues[0] ? 0.0 : 30.0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _toggleValues[0] = !_toggleValues[0];
                                      widget.params['tobi'] =
                                          _toggleValues[0];
                                    });
                                  },
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 250),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return RotationTransition(
                                          child: child, turns: animation);
                                    },
                                    child: _toggleValues[0]
                                        ? Icon(Icons.check_circle,
                                            color: Colors.green,
                                            size: 35.0,
                                            key: UniqueKey())
                                        : Icon(Icons.remove_circle_outline,
                                            color: Colors.red,
                                            size: 35.0,
                                            key: UniqueKey()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Text("トビ罰符",
                            style: _toggleValues[0]
                                ? _textStyle
                                : TextStyle(
                                    fontSize: 24.0, color: Colors.grey)),
                      ),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          enabled: _toggleValues[0],
                          controller: _controllers[0],
                          style: _toggleValues[0] ? null : TextStyle(color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (String score) {
                            setState(() {
                              widget.params['tobiPt'] = int.parse(_controllers[0].text);
                            }); 
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Text("ヤキトリ", style: _textStyle),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          height: 40.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: _toggleValues[1]
                                ? Colors.greenAccent[100]
                                : Colors.redAccent[100].withOpacity(0.5),
                          ),
                          child: Stack(
                            children: <Widget>[
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeIn,
                                top: 3.0,
                                left: _toggleValues[1] ? 30.0 : 0.0,
                                right: _toggleValues[1] ? 0.0 : 30.0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _toggleValues[1] = !_toggleValues[1];
                                      widget.params['yakitori'] =
                                          _toggleValues[1];
                                    });
                                  },
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 250),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return RotationTransition(
                                          child: child, turns: animation);
                                    },
                                    child: _toggleValues[1]
                                        ? Icon(Icons.check_circle,
                                            color: Colors.green,
                                            size: 35.0,
                                            key: UniqueKey())
                                        : Icon(Icons.remove_circle_outline,
                                            color: Colors.red,
                                            size: 35.0,
                                            key: UniqueKey()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Text("ヤキトリ罰符",
                            style: _toggleValues[1]
                                ? _textStyle
                                : TextStyle(
                                    fontSize: 24.0, color: Colors.grey)),
                      ),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          enabled: _toggleValues[1],
                          controller: _controllers[1],
                          style: _toggleValues[1] ? null : TextStyle(color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (String score) {
                            setState(() {
                              widget.params['yakitoriPt'] = int.parse(_controllers[1].text);
                            }); 
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Text("箱下精算", style: TextStyle(fontSize: 24.0)),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          height: 40.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: _toggleValues[2]
                                ? Colors.greenAccent[100]
                                : Colors.redAccent[100].withOpacity(0.5),
                          ),
                          child: Stack(
                            children: <Widget>[
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeIn,
                                top: 3.0,
                                left: _toggleValues[2] ? 30.0 : 0.0,
                                right: _toggleValues[2] ? 0.0 : 30.0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _toggleValues[2] = !_toggleValues[2];
                                      widget.params['debt'] =
                                          _toggleValues[2];
                                    });
                                  },
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 250),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return RotationTransition(
                                          child: child, turns: animation);
                                    },
                                    child: _toggleValues[2]
                                        ? Icon(Icons.check_circle,
                                            color: Colors.green,
                                            size: 35.0,
                                            key: UniqueKey())
                                        : Icon(Icons.remove_circle_outline,
                                            color: Colors.red,
                                            size: 35.0,
                                            key: UniqueKey()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Flexible>[
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      padding: _buttonPadding,
                      color: Colors.green[500],
                      textColor: Colors.white,
                      child: Text("戻る", style: _textStyle),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      padding: _buttonPadding,
                      color: Colors.green[500],
                      textColor: Colors.white,
                      child: Text("次へ", style: _textStyle),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          settings: const RouteSettings(
                              name: "/register/params_display"),
                          builder: (context) {
                            return ParamsDisplay(
                              title: widget.title,
                              params: widget.params,
                            );
                          },
                          fullscreenDialog: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
