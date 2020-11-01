import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: '設定',
            tiles: [
              SettingsTile(
                title: '記録一覧の並び順',
                onTap: () {
                  _showSortOrderSelectDialog();
                },
              ),
            ],
          ),
        ],
      ),
    );
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
}
