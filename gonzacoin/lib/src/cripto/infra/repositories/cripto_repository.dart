import 'package:fpdart/fpdart.dart';
import 'package:gonzacoin/src/cripto/domain/entities/cripto_entities.dart';
import 'package:gonzacoin/src/cripto/domain/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/cripto_datasource.dart';
import 'package:gonzacoin/src/cripto/infra/mappers/cripto_mapper.dart';

import '../../domain/errors/erros.dart';

class CriptoRepository implements ICriptoRepository {
  final ICriptoDataSource dataSource;
  CriptoRepository({required this.dataSource});

  @override
  Future<Either<ICriptoException, List<CriptoEntity>>> getAllCriptos() async {
    try {
      final criptosMap = await dataSource.getAllCriptos();
      final listCripto = _convert(criptosMap);
      return right(listCripto);
    } on ICriptoException catch (e) {
      return left(e);
    }
  }

  List<CriptoEntity> _convert(List<Map> list) {
    return list.map(CriptoMapper.fromMap).toList();
  }
}
