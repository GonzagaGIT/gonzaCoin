import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gonzacoin/src/cripto/domain/entities/cripto_entity.dart';
import 'package:gonzacoin/src/cripto/domain/errors/erros.dart';
import 'package:gonzacoin/src/cripto/infra/repositories/cripto_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('Should take a Map and return a Future List CryptoEntity ', () async{
    final dataSource = CriptoDataSourceMock();
    final assetDatasource = AssetCriptoDataSourceMock();
    when((() => dataSource.getAllCriptos())).thenAnswer(
      (_) async {
        return [
          {
            'asset_id': 'BTC',
            'name': 'Bitcoin',
            'price_usd': 0.0,
          },
          {
            'asset_id': 'USD',
            'name': 'dollar',
            'price_usd': 0.0,
          }
        ];
      },
    );

    when((() => assetDatasource.getAllAssetsCriptos())).thenAnswer(
      (_) async {
        return [
          {
            'asset_id': 'BTC',
            'url': 'test',
          },
           {
            'asset_id': 'USD',
            'url': 'dollar',
          }
        ];
      },
    );

    final repository = CriptoRepository( dataSource, assetDatasource);
    final result = await repository.getAllCriptos();

    expect(result, isA<Either<ICriptoException, List<CriptoEntity>>>());
  });
}
