import 'package:gonzacoin/src/modules/cripto/domain/entities/asset_cripto_entity.dart';
import 'package:gonzacoin/src/modules/cripto/infra/mappers/asset_cripto_mapper.dart';

import '../../domain/entities/cripto_entity.dart';

class CriptoMapper{
  static CriptoEntity fromMap(Map json){
    return CriptoEntity(
      id: json['asset_id'],
      name: json['name'],
      isFavorite: false,
      assetCripto: AssetCriptoMapper.fromMap(json['asset']??{}),
      price: verifyIsDouble(json['price_usd'])
    );}


    static double verifyIsDouble(dynamic value){

       if( value is double) {
        return value;
      }else{
       return double.tryParse(value.toString())??0.0;
      }
    }
}