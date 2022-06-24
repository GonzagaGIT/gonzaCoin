import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gonzacoin/src/cripto/domain/entities/cripto_entities.dart';
import 'package:gonzacoin/src/cripto/domain/errors/erros.dart';
import 'package:gonzacoin/src/cripto/infra/repositories/cripto_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('Should take a Map and return a Future List CryptoEntity ', () {
    final dataSource = CriptoDataSourceMock();
    when((() => dataSource.getAllCriptos())).thenAnswer(
      (_) async {
        return [
          {
            'asset_id': 'asdsad',
            'name': 'Bitcoin',
            'assetUrl': 'bitcoin',
            'price_usd': 0.0,
          }
        ];
      },
    );

    final repository = CriptoRepository(dataSource: dataSource);
    final result = repository.getAllCriptos();

    expect(result, isA<Future<Either<ICriptoException, List<CriptoEntity>>>>());
  });
}
