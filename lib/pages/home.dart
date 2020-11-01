import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Column;
import 'package:flutter/widgets.dart' as f show Column;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';
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

  Database get db => Provider.of<Database>(context);

  void _saveTimestamp() {
    final now = DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now());
    logger.info(now);
    db.insertTimestamp(TimestampsCompanion(timestamp: Value(now))).then(
        (value) => Fluttertoast.showToast(
            msg: "記録しました",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          )
        ],
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
