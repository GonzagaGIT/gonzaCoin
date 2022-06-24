import 'package:fpdart/fpdart.dart';

import '../entities/cripto_entities.dart';
import '../errors/erros.dart';

abstract class ICriptoRepository{
  Future<Either<ICriptoException, List<CriptoEntity>>> getAllCriptos();
}