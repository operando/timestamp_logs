import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Database get db => Provider.of<Database>(context);
  OrderingMode orderingMode;
  DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    _initOrderingMode();
    _loadDateFormat();
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
        stream: db.watchAllTimestamps(orderingMode),
        builder: (context, AsyncSnapshot<List<Timestamp>> snapshot) {
          return snapshot.data == null || snapshot.data.isEmpty
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
                          dateFormat
                              .format(snapshot.data[index].timestampDatetime),
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

  Future<void> _initOrderingMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      orderingMode = (preferences.getInt('sort_order') ?? 0) == 0
          ? OrderingMode.desc
          : OrderingMode.asc;
    });
  }

  Future<void> _loadDateFormat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dateFormat =
          DateFormat(prefs.getString('date_format') ?? 'yyyy/MM/dd HH:mm');
    });
  }
}
