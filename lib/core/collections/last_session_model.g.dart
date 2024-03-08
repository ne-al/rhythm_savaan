// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLastSessionCollection on Isar {
  IsarCollection<LastSession> get lastSessions => this.collection();
}

const LastSessionSchema = CollectionSchema(
  name: r'LastSession',
  id: 5107865283779768925,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'songId': PropertySchema(
      id: 1,
      name: r'songId',
      type: IsarType.string,
    ),
    r'songName': PropertySchema(
      id: 2,
      name: r'songName',
      type: IsarType.string,
    )
  },
  estimateSize: _lastSessionEstimateSize,
  serialize: _lastSessionSerialize,
  deserialize: _lastSessionDeserialize,
  deserializeProp: _lastSessionDeserializeProp,
  idName: r'id',
  indexes: {
    r'songId': IndexSchema(
      id: -4588889454650216128,
      name: r'songId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'songId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _lastSessionGetId,
  getLinks: _lastSessionGetLinks,
  attach: _lastSessionAttach,
  version: '3.1.0+1',
);

int _lastSessionEstimateSize(
  LastSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.songId.length * 3;
  bytesCount += 3 + object.songName.length * 3;
  return bytesCount;
}

void _lastSessionSerialize(
  LastSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
  writer.writeString(offsets[1], object.songId);
  writer.writeString(offsets[2], object.songName);
}

LastSession _lastSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LastSession();
  object.dateTime = reader.readDateTime(offsets[0]);
  object.id = id;
  object.songId = reader.readString(offsets[1]);
  object.songName = reader.readString(offsets[2]);
  return object;
}

P _lastSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lastSessionGetId(LastSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lastSessionGetLinks(LastSession object) {
  return [];
}

void _lastSessionAttach(
    IsarCollection<dynamic> col, Id id, LastSession object) {
  object.id = id;
}

extension LastSessionByIndex on IsarCollection<LastSession> {
  Future<LastSession?> getBySongId(String songId) {
    return getByIndex(r'songId', [songId]);
  }

  LastSession? getBySongIdSync(String songId) {
    return getByIndexSync(r'songId', [songId]);
  }

  Future<bool> deleteBySongId(String songId) {
    return deleteByIndex(r'songId', [songId]);
  }

  bool deleteBySongIdSync(String songId) {
    return deleteByIndexSync(r'songId', [songId]);
  }

  Future<List<LastSession?>> getAllBySongId(List<String> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'songId', values);
  }

  List<LastSession?> getAllBySongIdSync(List<String> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'songId', values);
  }

  Future<int> deleteAllBySongId(List<String> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'songId', values);
  }

  int deleteAllBySongIdSync(List<String> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'songId', values);
  }

  Future<Id> putBySongId(LastSession object) {
    return putByIndex(r'songId', object);
  }

  Id putBySongIdSync(LastSession object, {bool saveLinks = true}) {
    return putByIndexSync(r'songId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySongId(List<LastSession> objects) {
    return putAllByIndex(r'songId', objects);
  }

  List<Id> putAllBySongIdSync(List<LastSession> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'songId', objects, saveLinks: saveLinks);
  }
}

extension LastSessionQueryWhereSort
    on QueryBuilder<LastSession, LastSession, QWhere> {
  QueryBuilder<LastSession, LastSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LastSessionQueryWhere
    on QueryBuilder<LastSession, LastSession, QWhereClause> {
  QueryBuilder<LastSession, LastSession, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterWhereClause> songIdEqualTo(
      String songId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'songId',
        value: [songId],
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterWhereClause> songIdNotEqualTo(
      String songId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'songId',
              lower: [],
              upper: [songId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'songId',
              lower: [songId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'songId',
              lower: [songId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'songId',
              lower: [],
              upper: [songId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LastSessionQueryFilter
    on QueryBuilder<LastSession, LastSession, QFilterCondition> {
  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> dateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'songId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'songId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'songId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'songId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'songId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'songId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'songId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songId',
        value: '',
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'songId',
        value: '',
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'songName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'songName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition> songNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'songName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songName',
        value: '',
      ));
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterFilterCondition>
      songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'songName',
        value: '',
      ));
    });
  }
}

extension LastSessionQueryObject
    on QueryBuilder<LastSession, LastSession, QFilterCondition> {}

extension LastSessionQueryLinks
    on QueryBuilder<LastSession, LastSession, QFilterCondition> {}

extension LastSessionQuerySortBy
    on QueryBuilder<LastSession, LastSession, QSortBy> {
  QueryBuilder<LastSession, LastSession, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }
}

extension LastSessionQuerySortThenBy
    on QueryBuilder<LastSession, LastSession, QSortThenBy> {
  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<LastSession, LastSession, QAfterSortBy> thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }
}

extension LastSessionQueryWhereDistinct
    on QueryBuilder<LastSession, LastSession, QDistinct> {
  QueryBuilder<LastSession, LastSession, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<LastSession, LastSession, QDistinct> distinctBySongId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LastSession, LastSession, QDistinct> distinctBySongName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }
}

extension LastSessionQueryProperty
    on QueryBuilder<LastSession, LastSession, QQueryProperty> {
  QueryBuilder<LastSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LastSession, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<LastSession, String, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<LastSession, String, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }
}
