import '../entities/cripto_entities.dart';

abstract class ICriptoRepository{
  Future<List<CriptoEntity>> getAllCriptos();
}