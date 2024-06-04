// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_generation_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPasswordsGenerationModelCollection on Isar {
  IsarCollection<PasswordsGenerationModel> get passwordsGenerationModels =>
      this.collection();
}

const PasswordsGenerationModelSchema = CollectionSchema(
  name: r'PasswordsGenerationModel',
  id: 2093988437413654597,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'passwordText': PropertySchema(
      id: 1,
      name: r'passwordText',
      type: IsarType.string,
    )
  },
  estimateSize: _passwordsGenerationModelEstimateSize,
  serialize: _passwordsGenerationModelSerialize,
  deserialize: _passwordsGenerationModelDeserialize,
  deserializeProp: _passwordsGenerationModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _passwordsGenerationModelGetId,
  getLinks: _passwordsGenerationModelGetLinks,
  attach: _passwordsGenerationModelAttach,
  version: '3.1.0+1',
);

int _passwordsGenerationModelEstimateSize(
  PasswordsGenerationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.passwordText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _passwordsGenerationModelSerialize(
  PasswordsGenerationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
  writer.writeString(offsets[1], object.passwordText);
}

PasswordsGenerationModel _passwordsGenerationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PasswordsGenerationModel();
  object.dateTime = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.passwordText = reader.readStringOrNull(offsets[1]);
  return object;
}

P _passwordsGenerationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _passwordsGenerationModelGetId(PasswordsGenerationModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _passwordsGenerationModelGetLinks(
    PasswordsGenerationModel object) {
  return [];
}

void _passwordsGenerationModelAttach(
    IsarCollection<dynamic> col, Id id, PasswordsGenerationModel object) {
  object.id = id;
}

extension PasswordsGenerationModelQueryWhereSort on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QWhere> {
  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PasswordsGenerationModelQueryWhere on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QWhereClause> {
  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterWhereClause> idBetween(
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
}

extension PasswordsGenerationModelQueryFilter on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QFilterCondition> {
  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> dateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> dateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> dateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> dateTimeGreaterThan(
    DateTime? value, {
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

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> dateTimeLessThan(
    DateTime? value, {
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

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> dateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'passwordText',
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'passwordText',
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passwordText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passwordText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passwordText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passwordText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passwordText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
          QAfterFilterCondition>
      passwordTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passwordText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
          QAfterFilterCondition>
      passwordTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passwordText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordText',
        value: '',
      ));
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel,
      QAfterFilterCondition> passwordTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passwordText',
        value: '',
      ));
    });
  }
}

extension PasswordsGenerationModelQueryObject on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QFilterCondition> {}

extension PasswordsGenerationModelQueryLinks on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QFilterCondition> {}

extension PasswordsGenerationModelQuerySortBy on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QSortBy> {
  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      sortByPasswordText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordText', Sort.asc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      sortByPasswordTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordText', Sort.desc);
    });
  }
}

extension PasswordsGenerationModelQuerySortThenBy on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QSortThenBy> {
  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      thenByPasswordText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordText', Sort.asc);
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QAfterSortBy>
      thenByPasswordTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordText', Sort.desc);
    });
  }
}

extension PasswordsGenerationModelQueryWhereDistinct on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QDistinct> {
  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QDistinct>
      distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<PasswordsGenerationModel, PasswordsGenerationModel, QDistinct>
      distinctByPasswordText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passwordText', caseSensitive: caseSensitive);
    });
  }
}

extension PasswordsGenerationModelQueryProperty on QueryBuilder<
    PasswordsGenerationModel, PasswordsGenerationModel, QQueryProperty> {
  QueryBuilder<PasswordsGenerationModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PasswordsGenerationModel, DateTime?, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<PasswordsGenerationModel, String?, QQueryOperations>
      passwordTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passwordText');
    });
  }
}
