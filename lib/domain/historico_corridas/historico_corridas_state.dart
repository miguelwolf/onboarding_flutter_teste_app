import 'package:equatable/equatable.dart';
import 'package:onboarding_flutter_teste_app/domain/historico_corridas/historico_corridas_entity.dart';
import 'package:onboarding_flutter_teste_app/presentation/historico_corridas_view.dart';

abstract class HistoricoCorridasState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HistoricoCorridasInitial extends HistoricoCorridasState {}

class HistoricoCorridasLoading extends HistoricoCorridasState {}

class HistoricoCorridasSuccess extends HistoricoCorridasState {
  final List<HistoricoCorridasEntity> corridas;

  HistoricoCorridasSuccess({required this.corridas});

  @override
  List<Object?> get props => [corridas];
}

class HistoricoCorridasError extends HistoricoCorridasState {
  final String error;

  HistoricoCorridasError({required this.error});

  @override
  List<Object?> get props => [error];
}
