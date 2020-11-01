import 'package:moor_flutter/moor_flutter.dart';
import 'package:timestamp_log/models/timestamps.dart';

part 'database.g.dart';

@UseMoor(tables: [Timestamps])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

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
