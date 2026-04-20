import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter_teste_app/domain/historico_corridas/historico_corridas_bloc.dart';
import 'package:onboarding_flutter_teste_app/domain/historico_corridas/historico_corridas_state.dart';

class HistoricoCorridasView extends StatelessWidget {
  const HistoricoCorridasView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Corridas'),
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<HistoricoCorridasBloc, HistoricoCorridasState>(
        builder: (context, state) {
          if (state is HistoricoCorridasLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HistoricoCorridasSuccess) {
            final corridas = state.corridas;

            if (corridas.isEmpty) {
              return const Center(child: Text('Nenhuma corrida encontrada.'));
            }

            return ListView.builder(
              itemCount: corridas.length,
              itemBuilder: (context, index) {
                final corrida = corridas[index];
                return ListTile(
                  title: Text('De: ${corrida.enderecoOrigem}'),
                  subtitle: Text(
                    'Para: ${corrida.enderecoDestino}\nData: ${corrida.data}',
                  ),
                );
              },
            );
          }

          if (state is HistoricoCorridasError) {
            return Center(child: Text('Erro: ${state.error}'));
          }

          return const Center(
            child: Text('Inicie a busca para ver o histórico.'),
          );
        },
      ),
    );
  }
}
