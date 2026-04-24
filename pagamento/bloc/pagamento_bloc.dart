import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pagamento_event.dart';
part 'pagamento_state.dart';

class PagamentoBloc
    extends void Bloc<PagamentoEvent, PagamentoState> {
  PagamentoBloc() : super(PagamentoInitial()) {
    // on<MeuEvento>(_onMeuEvento);
  }
}