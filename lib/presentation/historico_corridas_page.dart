import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter_teste_app/data/repositories/historico_corridas_repository.dart';
import 'package:onboarding_flutter_teste_app/domain/historico_corridas/historico_corridas_bloc.dart';
import 'package:onboarding_flutter_teste_app/domain/historico_corridas/historico_corridas_event.dart';
import 'package:onboarding_flutter_teste_app/presentation/historico_corridas_view.dart';

class HistoricoCorridasPage extends StatelessWidget {
  const HistoricoCorridasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos o RepositoryProvider para fornecer o acesso aos dados
    return RepositoryProvider(
      create: (context) => HistoricoCorridasRepository(),
      child: MultiBlocProvider(
        providers: [
          // Aqui criamos o Bloc e injetamos o repositório que acabamos de fornecer acima
          BlocProvider(
            create: (context) => HistoricoCorridasBloc(
              context.read<HistoricoCorridasRepository>(),
            )..add(FetchCorridas()), // Já dispara a busca ao abrir a página
          ),
          // Se você tiver outros Blocs no futuro, basta adicioná-los aqui nesta lista
        ],
        child: const HistoricoCorridasView(),
      ),
    );
  }
}
