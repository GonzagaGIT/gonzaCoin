import 'package:fpdart/fpdart.dart';

import '../entities/cripto_entity.dart';
import '../errors/erros.dart';

abstract class ICriptoRepository{
  Future<Either<ICriptoException, List<CriptoEntity>>> getAllCriptos();
}