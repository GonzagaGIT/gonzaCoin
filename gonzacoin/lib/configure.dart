import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:gonzacoin/src/modules/cripto/domain/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/modules/cripto/domain/usecases/get_all_criptos.dart';
import 'package:gonzacoin/src/modules/cripto/external/cripto_dio_datasource.dart';
import 'package:gonzacoin/src/modules/cripto/infra/datasource/asset_cripto_datasource.dart';
import 'package:gonzacoin/src/modules/cripto/infra/datasource/cripto_datasource.dart';
import 'package:gonzacoin/src/modules/cripto/infra/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/modules/cripto/presenter/cubits/cripto_cubit.dart';
import 'environment.dart';
import 'src/modules/cripto/external/asset_cripto_dio_datasource.dart';
import 'src/shared/services/dio_interceptors.dart';

Future<void> configure() async {
  //utils
  GetIt.I.registerFactory<Dio>(() => Dio(BaseOptions(baseUrl: Environment.baseUrl))
    ..interceptors.add(CustomDioInterceptors()));

  //datasource
  GetIt.I.registerFactory<IAssetCriptoDataSource>(
      () => AssetCriptoDioDataSource(dio: GetIt.I<Dio>()));
  GetIt.I.registerFactory<ICriptoDataSource>(
      () => CriptoDioDataSource(dio: GetIt.I<Dio>()));

  //repository
  GetIt.I.registerFactory<ICriptoRepository>(() => CriptoRepository(
      GetIt.I<ICriptoDataSource>(), GetIt.I<IAssetCriptoDataSource>()));

  //usecase
  GetIt.I.registerFactory<IGetAllCriptos>(() => GetAllCriptos(repository: GetIt.I.get<ICriptoRepository>()));

  //cubit
  
  GetIt.I.registerFactory<CriptoCubit>(() => CriptoCubit(GetIt.I.get<IGetAllCriptos>()));
}
