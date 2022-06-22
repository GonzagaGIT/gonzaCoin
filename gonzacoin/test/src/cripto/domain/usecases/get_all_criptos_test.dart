import 'package:flutter_test/flutter_test.dart';
import 'package:gonzacoin/src/cripto/domain/entities/cripto_entities.dart';
import 'package:gonzacoin/src/cripto/domain/repositories/cripto_repository.dart';
import 'package:gonzacoin/src/cripto/domain/usecases/get_all_criptos.dart';
import 'package:mocktail/mocktail.dart';

class CriptoRepositoryMock extends Mock implements ICriptoRepository {}

class CriptoEntityMock extends Mock implements CriptoEntity {}

void main() {
  test('Should return a list of cryptoEntity', () async {
    final repository = CriptoRepositoryMock();
    final entity = CriptoEntityMock();
    when(() => repository.getAllCriptos()).thenAnswer((_) async {
      return [entity];
    });
    final usecase = GetAllCriptos(repository: repository);
    final result = await usecase.execute();
    expect(result, [entity]);


  });
}
