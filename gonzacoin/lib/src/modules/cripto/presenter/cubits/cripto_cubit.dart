import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gonzacoin/src/modules/cripto/domain/usecases/get_all_criptos.dart';

import '../../domain/entities/cripto_entity.dart';
part 'cripto_state.dart';
class CriptoCubit extends Cubit<CriptoState> {
  final IGetAllCriptos getAllCriptos;

  CriptoCubit(this.getAllCriptos) : super(CriptoInitialState());

  Future<void> fetchCriptos() async {
    emit(LoadingCriptoState());
    final result = await getAllCriptos.execute();
    final newState = result.fold((l) {
      return ErrorCriptoState(l.message);
    }, (r) {
      return r.isEmpty ? EmptyCriptoState() : SuccessCriptoState(r);
    });
    emit(newState);
  }

  double convertCurrency(double value){
    return value/5.24;
  }
}
