import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<SettingsPage> {
  DateTime sampleDateTime = DateTime.parse('2020-11-03 13:27:00');
  String dateFormat;

  @override
  void initState() {
    super.initState();
    _loadDateFormat();
  }

  Future<void> _loadDateFormat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dateFormat = prefs.getString('date_format') ?? 'yyyy/MM/dd HH:mm';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('設定'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 36),
              child: SettingsTile(
                title: '記録一覧の並び順',
                onTap: () {
                  _showSortOrderSelectDialog();
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: GestureDetector(
                onTap: () {
                  _showDateFormatSelectDialog();
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "日時のフォーマット",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      DateFormat(dateFormat).format(sampleDateTime),
                      style: TextStyle(fontSize: 16, color: Color(0xFF999999)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.5,
                        left: 2.25,
                      ),
                      child: Icon(
                        CupertinoIcons.forward,
                        color: Color(0xFFC7C7CC),
                        size: 21.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Future<void> _showSortOrderSelectDialog() async {
    switch (await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('記録一覧の並び順'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: const Text('降順（日時が新しいのが上）'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: const Text('昇順（日時が古いのが上）'),
              ),
            ],
          );
        })) {
      case 0:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('sort_order', 0);
        break;
      case 1:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('sort_order', 1);
        break;
    }
  }

  Future<void> _showDateFormatSelectDialog() async {
    switch (await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('日時のフォーマット'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child:
                    Text(DateFormat('yyyy/MM/dd HH:mm').format(sampleDateTime)),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child:
                    Text(DateFormat('yyyy-MM-dd HH:mm').format(sampleDateTime)),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Text(
                    DateFormat('yyyy年MM月dd HH時mm分').format(sampleDateTime)),
              ),
            ],
          );
        })) {
      case 0:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('date_format', 'yyyy/MM/dd HH:mm');
        break;
      case 1:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('date_format', 'yyyy-MM-dd HH:mm');
        break;
      case 2:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('date_format', 'yyyy年MM月dd HH時mm分');
        break;
    }
    _loadDateFormat();
  }
}
