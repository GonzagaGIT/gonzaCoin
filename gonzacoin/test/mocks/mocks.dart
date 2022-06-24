import 'package:gonzacoin/src/modules/cripto/domain/entities/cripto_entity.dart';
import 'package:gonzacoin/src/modules/cripto/domain/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/modules/cripto/infra/datasource/asset_cripto_datasource.dart';
import 'package:gonzacoin/src/modules/cripto/infra/datasource/cripto_datasource.dart';
import 'package:mocktail/mocktail.dart';

class CriptoRepositoryMock extends Mock implements ICriptoRepository {}

class CriptoEntityMock extends Mock implements CriptoEntity {}

class CriptoDataSourceMock extends Mock implements ICriptoDataSource {}

class AssetCriptoDataSourceMock extends Mock implements IAssetCriptoDataSource {}