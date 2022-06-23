import 'package:gonzacoin/src/cripto/domain/entities/cripto_entities.dart';
import 'package:gonzacoin/src/cripto/domain/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/cripto_datasource.dart';
import 'package:mocktail/mocktail.dart';

class CriptoRepositoryMock extends Mock implements ICriptoRepository {}

class CriptoEntityMock extends Mock implements CriptoEntity {}

class CriptoDataSourceMock extends Mock implements ICriptoDataSource {}