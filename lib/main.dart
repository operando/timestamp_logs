import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timestamp_log/pages/home.dart';
import 'package:timestamp_log/pages/settings.dart';
import 'package:timestamp_log/pages/timestamp_logs.dart';

import 'db/database.dart';

Future<void> main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
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
        '/log_list': (BuildContext context) => TimestampLogsPage(title: '記録一覧'),
        '/settings': (BuildContext context) => SettingsPage(),
      },
    );
  }
}
