import 'package:moor_flutter/moor_flutter.dart';

class Timestamps extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get timestamp => text()();

  @override
  Set<Column> get primaryKey => {id};
}
