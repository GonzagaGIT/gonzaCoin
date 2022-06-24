import 'package:gonzacoin/src/cripto/domain/entities/asset_cripto_entity.dart';
import 'package:gonzacoin/src/cripto/infra/mappers/asset_cripto_mapper.dart';

import '../../domain/entities/cripto_entity.dart';

class CriptoMapper{
  static CriptoEntity fromMap(Map json){
    return CriptoEntity(
      id: json['asset_id'],
      name: json['name'],
      isFavorite: false,
      assetCripto: AssetCriptoMapper.fromMap(json['asset']),
      price: json['price_usd'],
    );}
}