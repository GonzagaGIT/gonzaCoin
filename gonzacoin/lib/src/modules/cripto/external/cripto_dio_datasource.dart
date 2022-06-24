import 'package:dio/dio.dart';
import 'package:gonzacoin/src/modules/cripto/domain/errors/erros.dart';
import 'package:gonzacoin/src/modules/cripto/infra/datasource/cripto_datasource.dart';

class CriptoDioDataSource implements ICriptoDataSource {
  final Dio dio;
  CriptoDioDataSource({required this.dio});
  @override
  Future<List<Map>> getAllCriptos() async {
    try {
      final response = await dio.get('assets/icons');
      final result = (response.data as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      return result;
    } catch (e, s) {
      throw DatasourceGetException(e.toString(), s);
    }
  }
  
 
}
