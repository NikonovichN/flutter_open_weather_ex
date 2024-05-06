import 'dart:convert';

import 'package:either_dart/src/either.dart';

import '../../domain/entity/locale.dart';
import '../../domain/data/locale_repository.dart';
import '../data_source/locale_data_source_local.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final LocaleDataSource _localeDataSource;

  const LocaleRepositoryImpl({required LocaleDataSource localeDataSource})
      : _localeDataSource = localeDataSource;

  @override
  Future<Either<String, LocaleEntity>> readLocale() async {
    try {
      final response = await _localeDataSource.readLocale();

      if (response == null) {
        throw 'Empty locale!';
      }

      return Right(jsonDecode(response));
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, bool>> writeLocale(LocaleEntity locale) async {
    try {
      await _localeDataSource.writeLocale(jsonEncode(locale.name));
      return const Right(true);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
