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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: Database().watchAllTimestamps(),
        builder: (context, AsyncSnapshot<List<Timestamp>> snapshot) {
          return ListView.builder(
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
