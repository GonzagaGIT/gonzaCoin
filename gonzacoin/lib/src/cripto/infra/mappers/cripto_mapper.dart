import '../../domain/entities/cripto_entities.dart';

class CriptoMapper{
  static CriptoEntity fromMap(Map json){
    return CriptoEntity(
      id: json['asset_id'],
      name: json['name'],
      isFavorite: false,
      assetUrl: '',
      price: json['price_usd'],
    );}
}