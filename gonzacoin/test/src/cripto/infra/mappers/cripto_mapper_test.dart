import 'package:flutter_test/flutter_test.dart';
import 'package:gonzacoin/src/modules/cripto/domain/entities/cripto_entity.dart';
import 'package:gonzacoin/src/modules/cripto/infra/mappers/cripto_mapper.dart';

void main() {
  test('should convert a map to an object of type cripto', () {
    final cripto = CriptoMapper.fromMap({
      'asset_id': 'asdsad',
      'name': 'Bitcoin',
      'asset': {
        'asset_id': 'BTC',
        'url': 'test',
      },
      'price_usd': 0.0,
    });

    expect(cripto, isA<CriptoEntity>());
  });
}
