import 'package:fpdart/fpdart.dart';
import 'package:gonzacoin/src/cripto/domain/entities/asset_cripto_entity.dart';
import 'package:gonzacoin/src/cripto/domain/entities/cripto_entity.dart';
import 'package:gonzacoin/src/cripto/domain/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/asset_cripto_datasource.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/cripto_datasource.dart';
import 'package:gonzacoin/src/cripto/infra/mappers/asset_cripto_mapper.dart';
import 'package:gonzacoin/src/cripto/infra/mappers/cripto_mapper.dart';

import '../../domain/errors/erros.dart';

class CriptoRepository implements ICriptoRepository {
  final ICriptoDataSource criptoDataSource;
  final IAssetCriptoDataSource assetDatasource;
  CriptoRepository(this.criptoDataSource, this.assetDatasource);

  @override
  Future<Either<ICriptoException, List<CriptoEntity>>> getAllCriptos() async {
    try {
      final criptosMap = await criptoDataSource.getAllCriptos();
      final assetsMap = await assetDatasource.getAllAssetsCriptos();
      final listCripto = _convert(criptosMap: criptosMap, assetsMap: assetsMap);
      return right(listCripto);
    } on ICriptoException catch (e) {
      return left(e);
    }
  }

  List<CriptoEntity> _convert({required List<Map> criptosMap, required List<Map> assetsMap }) {
     for (var asset in assetsMap) {
        for (var cripto in criptosMap) {
          if (asset['asset_id'] == cripto['asset_id']) {
            cripto['asset'] = asset;
          }
        }
      }
       return criptosMap.map(CriptoMapper.fromMap).toList();

  }

  
}
