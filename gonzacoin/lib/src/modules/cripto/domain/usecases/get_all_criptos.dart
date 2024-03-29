import 'package:fpdart/fpdart.dart';
import 'package:gonzacoin/src/modules/cripto/domain/errors/erros.dart';
import 'package:gonzacoin/src/modules/cripto/domain/repositories/cripto_repository.dart';

import '../entities/cripto_entity.dart';

abstract class IGetAllCriptos {
  Future<Either<ICriptoException, List<CriptoEntity>>> execute();
} 

class GetAllCriptos implements IGetAllCriptos{
  final ICriptoRepository repository;
  GetAllCriptos({required this.repository});

  @override
  Future<Either<ICriptoException, List<CriptoEntity>>> execute() async{
    return await repository.getAllCriptos();
  }

}