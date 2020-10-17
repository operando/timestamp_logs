import 'package:flutter/material.dart';
import 'package:timestamp_log/pages/home.dart';
import 'package:timestamp_log/pages/timestamp_logs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  MyApp.forDesignTime();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timestamp log',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Timestamp log'),
      routes: {
        '/log_list': (BuildContext context) => TimestampLogsPage(title: '記録一覧')
      },
    );
  }
}
