import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/database.dart';

class TimestampLogsPage extends StatefulWidget {
  TimestampLogsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _TimestampLogsPageState();
  }
}

class _TimestampLogsPageState extends State<TimestampLogsPage> {
  final db = Database();
  Stream<List<Timestamp>> logs;

  @override
  void initState() {
    super.initState();
    logs = db.watchAllTimestamps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('記録をすべて消しますがよろしいですか？'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('キャンセル'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            db.deleteAllTimestamp();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: logs,
        builder: (context, AsyncSnapshot<List<Timestamp>> snapshot) {
          return snapshot.data.isEmpty
              ? Center(
                  child: const Text(
                    '記録がありません',
                    style: TextStyle(fontSize: 30),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (_, index) {
                    return Card(
                      child: Padding(
                        child: Text(
                          snapshot.data[index].timestamp,
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        padding: EdgeInsets.all(28),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
        },
      ),
    );
  }
}
