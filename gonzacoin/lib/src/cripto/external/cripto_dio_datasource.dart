
import 'package:dio/dio.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/cripto_datasource.dart';

class CriptoDioDataSource implements ICriptoDataSource{

  final Dio dio;
  CriptoDioDataSource({required this.dio});
  @override
  Future<List<Map>> getAllCriptos() async{
    final response = await dio.get('https://example.com');
    final result =  (response.data as List).map((e) => e as Map<String, dynamic>).toList();
    return result;

  }

}