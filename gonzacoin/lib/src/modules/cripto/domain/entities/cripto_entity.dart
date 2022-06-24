import 'package:gonzacoin/src/modules/cripto/domain/entities/asset_cripto_entity.dart';

class CriptoEntity{
  final String id;
  final String name;
  final double price;
  final AssetCriptoEntity assetCripto;
  final bool isFavorite;
  const CriptoEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.assetCripto,
    required this.isFavorite
  });
}