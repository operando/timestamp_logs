import 'package:moor_flutter/moor_flutter.dart';
import 'package:timestamp_log/models/timestamps.dart';

part 'database.g.dart';

@UseMoor(tables: [Timestamps])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.addColumn(timestamps, timestamps.timestampDatetime);
        }
      });

  Stream<List<Timestamp>> watchAllTimestamps(OrderingMode orderingMode) =>
      (select(timestamps)
            ..orderBy(
                [(t) => OrderingTerm(expression: t.id, mode: orderingMode)]))
          .watch();

  Future insertTimestamp(TimestampsCompanion timestamp) =>
      into(timestamps).insert(timestamp);

  Future deleteAllTimestamp() => transaction(() async {
        await delete(timestamps).go();
      });
}
