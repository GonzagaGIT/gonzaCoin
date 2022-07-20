import 'package:dio/dio.dart';
import 'package:gonzacoin/src/modules/cripto/domain/errors/erros.dart';
import 'package:gonzacoin/src/modules/cripto/infra/datasource/cripto_datasource.dart';

class CriptoDioDataSource implements ICriptoDataSource {
  final Dio dio;
  CriptoDioDataSource({required this.dio});
  @override
  Future<List<Map>> getAllCriptos() async {
    try {
      final response = await dio.get('assets');
      final result = (response.data as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      final resultFiltered = result.where((e) => e['type_is_crypto'] == 1 && e.containsKey('price_usd')).toList();
      return resultFiltered;
    } catch (e, s) {
      throw DatasourceGetException(e.toString(), s);
    }
  }
  
 
}
