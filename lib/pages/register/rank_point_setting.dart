import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './detail_setting.dart';

class RankPointSetting extends StatefulWidget {
  RankPointSetting({Key key, this.title, this.params}) : super(key: key);

  final String title;
  var params; @override
  _RankPointSettingState createState() => _RankPointSettingState();
}

class _RankPointSettingState extends State<RankPointSetting> {
  final TextStyle _textStyle = TextStyle(fontSize: 24.0);
  final EdgeInsets _buttonPadding =
      EdgeInsets.only(top: 20.0, right: 40.0, bottom: 20.0, left: 40.0);

  var _controllers = [];

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
        widget.params['pNum'], (_) => new TextEditingController());

    if (widget.params['pNum'] == 3) {
      _controllers[0].text = "30000";
      _controllers[1].text = "0";
      _controllers[2].text = "-30000";

      widget.params['fstPt'] = _controllers[0].text;
      widget.params['sndPt'] = _controllers[1].text;
      widget.params['thdPt'] = _controllers[2].text;
      widget.params['frhPt'] = null;
    } else if (widget.params['pNum'] == 4) {
      _controllers[0].text = "30000";
      _controllers[1].text = "10000";
      _controllers[2].text = "-10000";
      _controllers[3].text = "-30000";

      widget.params['fstPt'] = _controllers[0].text;
      widget.params['sndPt'] = _controllers[1].text;
      widget.params['thdPt'] = _controllers[2].text;
      widget.params['frhPt'] = _controllers[3].text;
    }
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
              child: Text("順位ウマを入力してください", style: _textStyle),
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
                          child: Text("1位ウマ", style: _textStyle),
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
                              WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                            ],
                            onChanged: (String score) {
                              setState(() {
                                widget.params['fstPt'] = int.parse(_controllers[0].text);
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
                          child: Text("2位ウマ", style: _textStyle),
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
                              WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                            ],
                            onChanged: (String score) {
                              setState(() {
                                widget.params['sndPt'] = int.parse(_controllers[1].text);
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
                          child: Text("3位ウマ", style: _textStyle),
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: _controllers[2],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                            ],
                            onChanged: (String score) {
                              setState(() {
                                widget.params['thdPt'] = int.parse(_controllers[2].text);
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
                          child: Text("4位ウマ",
                              style: widget.params['pNum'] == 3
                                  ? TextStyle(
                                      fontSize: 24.0, color: Colors.grey)
                                  : _textStyle),
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            enabled: widget.params['pNum'] == 3 ? false : true,
                            controller: widget.params['pNum'] == 3
                                ? null
                                : _controllers[3],
                            style: widget.params['pNum'] == 3 ? TextStyle(color: Colors.grey) : null,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                            ],
                            onChanged: (String score) {
                              setState(() {
                                widget.params['frhPt'] = int.parse(_controllers[3].text);
                              }); 
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
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
                              name: "/register/detail_setting"),
                          builder: (context) {
                            return DetailSetting(
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
