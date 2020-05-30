import 'package:flutter/material.dart';

class ParamsDisplay extends StatelessWidget {
  ParamsDisplay({Key key, this.title, this.params}) : super(key: key);

  final String title;
  var params;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("${params}"),
      ),
    );
  }
}
