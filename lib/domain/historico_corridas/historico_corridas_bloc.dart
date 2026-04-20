import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter_teste_app/data/repositories/historico_corridas_repository.dart';
import 'historico_corridas_event.dart';
import 'historico_corridas_state.dart';

class HistoricoCorridasBloc
    extends Bloc<HistoricoCorridasEvent, HistoricoCorridasState>
    with WidgetsBindingObserver {
  final HistoricoCorridasRepository _repository;

  HistoricoCorridasBloc(this._repository) : super(HistoricoCorridasInitial()) {
    on<FetchCorridas>(_onFetchCorridas);
  }

  Future<void> _onFetchCorridas(
    FetchCorridas event,
    Emitter<HistoricoCorridasState> emit,
  ) async {
    emit(HistoricoCorridasLoading());
    try {
      final corridas = await _repository.fetchCorridas();
      emit(HistoricoCorridasSuccess(corridas: corridas));
    } catch (e) {
      emit(HistoricoCorridasError(error: e.toString()));
    }
  }
}
