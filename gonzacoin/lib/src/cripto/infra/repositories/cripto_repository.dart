
import 'package:gonzacoin/src/cripto/domain/entities/cripto_entities.dart';
import 'package:gonzacoin/src/cripto/domain/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/cripto_datasource.dart';
import 'package:gonzacoin/src/cripto/infra/mappers/cripto_mapper.dart';

class CriptoRepository implements ICriptoRepository{
  
  final ICriptoDataSource dataSource;
  CriptoRepository({required this.dataSource});

  @override
  Future<List<CriptoEntity>> getAllCriptos() async{
    final criptosMap = await dataSource.getAllCriptos();
    final listCripto = _convert(criptosMap);
    return listCripto;

  }
  List<CriptoEntity> _convert(List<Map> list){
    return list.map(CriptoMapper.fromMap).toList();  
  }
  
}