import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './rank_point_setting.dart';

class ScoreSetting extends StatefulWidget {
  ScoreSetting({Key key, this.title, this.params}) : super(key: key);

  final String title;
  var params;

  @override
  _ScoreSettingState createState() => _ScoreSettingState();
}

class _ScoreSettingState extends State<ScoreSetting> {
  final TextStyle _textStyle = TextStyle(fontSize: 24.0);
  final EdgeInsets _buttonPadding =
      EdgeInsets.only(top: 20.0, right: 40.0, bottom: 20.0, left: 40.0);

  var _controllers = List.generate(2, (_) => new TextEditingController());
  int _hill;

  void _updateScore(String score) {
    try {
      setState(() {
        _hill = (int.parse(_controllers[1].text) -
                int.parse(_controllers[0].text)) *
            widget.params['pNum'];
        widget.params['sScore'] = int.parse(_controllers[0].text);
        widget.params['rScore'] = int.parse(_controllers[1].text);
        widget.params['hill'] = _hill;
      });
    } catch (exception) {
      if (_controllers[0].text == "") {
        setState(() {
          _controllers[0].text = "";
        });
      } else if (_controllers[1].text == "") {
        setState(() {
          _controllers[1].text = "";
        });
      }
      _hill = null;
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.params['pNum'] == 3) {
      _controllers[0].text = "35000";
      _controllers[1].text = "35000";
    } else if (widget.params['pNum'] == 4) {
      _controllers[0].text = "25000";
      _controllers[1].text = "30000";
    }

    _hill =
        (int.parse(_controllers[1].text) - int.parse(_controllers[0].text)) *
            widget.params['pNum'];
    widget.params['sScore'] = int.parse(_controllers[0].text);
    widget.params['rScore'] = int.parse(_controllers[1].text);
    widget.params['hill'] = _hill;
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
              child: Text("持ち点と返し点を入力してください", style: _textStyle),
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
                          child: Text("持ち点", style: _textStyle),
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: _controllers[0],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            onChanged: _updateScore,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Flexible>[
                        Flexible(
                          flex: 1,
                          child: Text("返し点", style: _textStyle),
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: _controllers[1],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            onChanged: _updateScore,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Flexible>[
                        Flexible(
                          flex: 1,
                          child: Text("オカ", style: _textStyle),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text("${_hill}", style: _textStyle),
                        ),
                      ],
                    ),
                  ]),
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
                      onPressed: _hill != null
                          ? () => Navigator.of(context).push(MaterialPageRoute(
                                settings: const RouteSettings(
                                    name: "/register/rank_point_setting"),
                                builder: (context) {
                                  return RankPointSetting(
                                      title: widget.title,
                                      params: widget.params);
                                },
                                fullscreenDialog: true,
                              ))
                          : null,
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
