import 'package:moor_flutter/moor_flutter.dart';

class Timestamps extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get timestamp => text().nullable()();

  DateTimeColumn get timestampDatetime => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
