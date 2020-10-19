import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timestamp_log/pages/home.dart';
import 'package:timestamp_log/pages/timestamp_logs.dart';

import 'db/database.dart';

void main() {
  runApp(
    Provider<Database>(
      create: (context) => Database(),
      child: MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
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
