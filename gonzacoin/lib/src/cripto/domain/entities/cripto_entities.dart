class CriptoEntity{
  final String id;
  final String name;
  final double price;
  final String assetUrl;
  final bool isFavorite;
  const CriptoEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.assetUrl,
    required this.isFavorite
  });
}