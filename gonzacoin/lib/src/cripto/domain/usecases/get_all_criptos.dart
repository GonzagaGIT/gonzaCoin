import 'package:gonzacoin/src/cripto/domain/repositories/cripto_repository.dart';

import '../entities/cripto_entities.dart';

abstract class IGetAllCriptos {
  Future<List<CriptoEntity>> execute();
} 

class GetAllCriptos implements IGetAllCriptos{
  final ICriptoRepository repository;
  GetAllCriptos({required this.repository});

  @override
  Future<List<CriptoEntity>> execute() {
    return repository.getAllCriptos();
  }

}