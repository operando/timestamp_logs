// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Timestamp extends DataClass implements Insertable<Timestamp> {
  final int id;
  final String timestamp;
  final DateTime timestampDatetime;
  Timestamp(
      {@required this.id, this.timestamp, @required this.timestampDatetime});
  factory Timestamp.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Timestamp(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      timestamp: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      timestampDatetime: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}timestamp_datetime']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<String>(timestamp);
    }
    if (!nullToAbsent || timestampDatetime != null) {
      map['timestamp_datetime'] = Variable<DateTime>(timestampDatetime);
    }
    return map;
  }

  TimestampsCompanion toCompanion(bool nullToAbsent) {
    return TimestampsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      timestampDatetime: timestampDatetime == null && nullToAbsent
          ? const Value.absent()
          : Value(timestampDatetime),
    );
  }

  factory Timestamp.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Timestamp(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
      timestampDatetime:
          serializer.fromJson<DateTime>(json['timestampDatetime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<String>(timestamp),
      'timestampDatetime': serializer.toJson<DateTime>(timestampDatetime),
    };
  }

  Timestamp copyWith({int id, String timestamp, DateTime timestampDatetime}) =>
      Timestamp(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        timestampDatetime: timestampDatetime ?? this.timestampDatetime,
      );
  @override
  String toString() {
    return (StringBuffer('Timestamp(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('timestampDatetime: $timestampDatetime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(timestamp.hashCode, timestampDatetime.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Timestamp &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.timestampDatetime == this.timestampDatetime);
}

class TimestampsCompanion extends UpdateCompanion<Timestamp> {
  final Value<int> id;
  final Value<String> timestamp;
  final Value<DateTime> timestampDatetime;
  const TimestampsCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.timestampDatetime = const Value.absent(),
  });
  TimestampsCompanion.insert({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    @required DateTime timestampDatetime,
  }) : timestampDatetime = Value(timestampDatetime);
  static Insertable<Timestamp> custom({
    Expression<int> id,
    Expression<String> timestamp,
    Expression<DateTime> timestampDatetime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (timestampDatetime != null) 'timestamp_datetime': timestampDatetime,
    });
  }

  TimestampsCompanion copyWith(
      {Value<int> id,
      Value<String> timestamp,
      Value<DateTime> timestampDatetime}) {
    return TimestampsCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      timestampDatetime: timestampDatetime ?? this.timestampDatetime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    if (timestampDatetime.present) {
      map['timestamp_datetime'] = Variable<DateTime>(timestampDatetime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimestampsCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('timestampDatetime: $timestampDatetime')
          ..write(')'))
        .toString();
  }
}

class $TimestampsTable extends Timestamps
    with TableInfo<$TimestampsTable, Timestamp> {
  final GeneratedDatabase _db;
  final String _alias;
  $TimestampsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedTextColumn _timestamp;
  @override
  GeneratedTextColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedTextColumn _constructTimestamp() {
    return GeneratedTextColumn(
      'timestamp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timestampDatetimeMeta =
      const VerificationMeta('timestampDatetime');
  GeneratedDateTimeColumn _timestampDatetime;
  @override
  GeneratedDateTimeColumn get timestampDatetime =>
      _timestampDatetime ??= _constructTimestampDatetime();
  GeneratedDateTimeColumn _constructTimestampDatetime() {
    return GeneratedDateTimeColumn(
      'timestamp_datetime',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, timestamp, timestampDatetime];
  @override
  $TimestampsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'timestamps';
  @override
  final String actualTableName = 'timestamps';
  @override
  VerificationContext validateIntegrity(Insertable<Timestamp> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    }
    if (data.containsKey('timestamp_datetime')) {
      context.handle(
          _timestampDatetimeMeta,
          timestampDatetime.isAcceptableOrUnknown(
              data['timestamp_datetime'], _timestampDatetimeMeta));
    } else if (isInserting) {
      context.missing(_timestampDatetimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Timestamp map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Timestamp.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TimestampsTable createAlias(String alias) {
    return $TimestampsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TimestampsTable _timestamps;
  $TimestampsTable get timestamps => _timestamps ??= $TimestampsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timestamps];
}
