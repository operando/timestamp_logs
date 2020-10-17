import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Column;
import 'package:flutter/widgets.dart' as f show Column;
import 'package:moor_flutter/moor_flutter.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:timestamp_log/db/database.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final logger = SimpleLogger();
  final db = Database();

  void _saveTimestamp() {
    logger.info(DateTime.now());
    db.insertTimestamp(
        TimestampsCompanion(timestamp: Value(DateTime.now().toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: f.Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: RaisedButton(
                child: Text(
                  "記録",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                textColor: Colors.white,
                color: Color(0xff00d9ff),
                shape: CircleBorder(
                  side: BorderSide(
                    color: Color(0xff00d9ff),
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: _saveTimestamp,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 96, 0, 0),
              width: 200,
              height: 48,
              child: RaisedButton(
                textColor: Colors.black,
                child: Text('記録一覧'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/log_list');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}