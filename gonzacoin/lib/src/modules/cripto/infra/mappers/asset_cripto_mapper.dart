
import 'package:gonzacoin/src/modules/cripto/domain/entities/asset_cripto_entity.dart';

class AssetCriptoMapper{
  static AssetCriptoEntity fromMap(Map json){
    return AssetCriptoEntity(
      assetId: json['asset_id']??'',
      url: json['url']??'http:example/',
    );}
}