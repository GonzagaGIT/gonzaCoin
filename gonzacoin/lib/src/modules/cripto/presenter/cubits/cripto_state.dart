
part of 'cripto_cubit.dart';

abstract class CriptoState extends Equatable{}


class CriptoInitialState extends CriptoState {
  @override
  List<Object?> get props => [];
}

class SuccessCriptoState extends CriptoState {
  final List<CriptoEntity> criptos;
   SuccessCriptoState(this.criptos);  
   
  @override
  List<Object?> get props => [criptos];
}

class EmptyCriptoState extends SuccessCriptoState {
  EmptyCriptoState() : super([]);
}

class LoadingCriptoState extends CriptoState {
  @override
  List<Object?> get props => [];
}

class ErrorCriptoState extends CriptoState {
  final String message;

  ErrorCriptoState(this.message);
  
  @override
  List<Object?> get props => [message];
  
}
