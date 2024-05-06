import 'package:either_dart/either.dart';

import '../entity/locale.dart';

abstract class LocaleRepository {
  Future<Either<String, LocaleEntity>> readLocale();
  Future<Either<String, bool>> writeLocale(LocaleEntity locale);
}
