import 'package:dio/dio.dart';
import 'package:gonzacoin/src/cripto/domain/errors/erros.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/asset_cripto_datasource.dart';
import 'package:gonzacoin/src/cripto/infra/datasource/cripto_datasource.dart';

class AssetCriptoDioDataSource implements IAssetCriptoDataSource {
  final Dio dio;
  AssetCriptoDioDataSource({required this.dio});
  @override
  Future<List<Map>> getAllAssetsCriptos() async {
    try {
      final response = await dio.get('https://example.com');
      final result = (response.data as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      return result;
    } catch (e, s) {
      throw DatasourceGetException(e.toString(), s);
    }
  }
  
 
}
