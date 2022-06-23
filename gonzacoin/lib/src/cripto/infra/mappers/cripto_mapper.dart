import '../../domain/entities/cripto_entities.dart';

class CriptoMapper{
  static CriptoEntity fromMap(Map json){
    return CriptoEntity(
      id: json['id'],
      name: json['name'],
      isFavorite: false,
      assetUrl: json['assetUrl'],
      price: json['price'],
    );}
}