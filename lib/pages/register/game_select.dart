import 'package:flutter/material.dart';
import './score_setting.dart';

class GameSelect extends StatefulWidget {
  GameSelect({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GameSelectState createState() => _GameSelectState();
}

class _GameSelectState extends State<GameSelect> {
  final TextStyle _textStyle = TextStyle(fontSize: 24.0);
  final EdgeInsets _buttonPadding =
      EdgeInsets.only(top: 20.0, right: 40.0, bottom: 20.0, left: 40.0);

  List<bool> _selections = List.generate(3, (_) => false);

  var params = {};

  @override
  void initState() {
    super.initState();
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
              Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Flexible>[
          Flexible(
            flex: 1,
            child: Center(
              child: Text("どちらの登録をしますか?", style: _textStyle),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <FlatButton>[
                  FlatButton(
                    padding: _buttonPadding,
                    color: _selections[0] ? Colors.green[500] : Colors.grey,
                    disabledColor: Colors.grey,
                    textColor: Colors.white,
                    child: Text("3人麻雀", style: _textStyle),
                    onPressed: () => setState(() {
                      _selections[0] = !_selections[0];
                      _selections[1] = !_selections[0] && _selections[1];
                      _selections[2] = (!_selections[0] && _selections[1]) ||
                          (_selections[0] && !_selections[1]);
                      params['pNum'] = 3;
                    }),
                  ),
                  FlatButton(
                    padding: _buttonPadding,
                    color: _selections[1] ? Colors.green[500] : Colors.grey,
                    disabledColor: Colors.grey,
                    textColor: Colors.white,
                    child: Text("4人麻雀", style: _textStyle),
                    onPressed: () => setState(() {
                      _selections[1] = !_selections[1];
                      _selections[0] = !_selections[1] && _selections[0];
                      _selections[2] = (!_selections[0] && _selections[1]) ||
                          (_selections[0] && !_selections[1]);
                      params['pNum'] = 4;
                    }),
                  ),
                ],
              ),
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
                    onPressed: _selections[2]
                        ? () => Navigator.of(context).push(
                              MaterialPageRoute(
                                settings: const RouteSettings(
                                    name: "/register/score_setting"),
                                builder: (context) {
                                  return ScoreSetting(
                                      title: widget.title,
                                      params: params,
                                  );
                                },
                                fullscreenDialog: true,
                              ),
                            )
                        : null,
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
