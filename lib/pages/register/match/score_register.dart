import 'package:flutter/material.dart';
import 'package:flutter/service.dart';

class ScoreRegister extends StatefulWidget {
  ScoreRegister({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScoreRegisterState createState() => _ScoreRegisterState();
}

class _ScoreRegisterState extends State<ScoreRegister> {
  final TextStyle _textStyle = TextStyle(fontSize: 24.0);
  final EdgeInsets _buttonPadding =
      EdgeInsets.only(top: 20.0, right: 40.0, bottom: 20.0, left: 40.0);

  var _controllers = List.generate(4, (_) => new TextEditingController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scafold(
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Flexible>[
            Flexible(
              flex: 1,
              child: Text("点数登録", style: _textStyle),
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
                        child: Icon(Icons.star),
                      ),
                      Flexible(
                        flex: 2,
                        child: TextField(
                          controller: _controllers[0],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                          ],
                          onChanged: (String score) {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Icon(Icons.star),
                      ),
                      Flexible(
                        flex: 2,
                        child: TextField(
                          controller: _controllers[1],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                          ],
                          onChanged: (String score) {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Icon(Icons.heart),
                      ),
                      Flexible(
                        flex: 2,
                        child: TextField(
                          controller: _controllers[2],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                          ],
                          onChanged: (String score) {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Flexible>[
                      Flexible(
                        flex: 1,
                        child: Icon(Icons.star),
                      ),
                      Flexible(
                        flex: 2,
                        child: TextField(
                          controller: _controllers[3],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter(RegExp("[0-9-]")),
                          ],
                          onChanged: (String score) {},
                        ),
                      ),
                    ],
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
