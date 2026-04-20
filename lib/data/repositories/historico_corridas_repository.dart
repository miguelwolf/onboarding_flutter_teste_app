import 'package:onboarding_flutter_teste_app/data/models/historico_corridas_model.dart';
import 'package:onboarding_flutter_teste_app/domain/historico_corridas/historico_corridas_entity.dart';
import 'package:onboarding_flutter_teste_app/test/data/data_source/historico_corridas_api_response_json_mock.dart';

class HistoricoCorridasRepository {
  Future<List<HistoricoCorridasEntity>> fetchCorridas() async {
    // Simula o tempo de resposta da API
    await Future.delayed(const Duration(seconds: 2));

    // Acessa a lista dentro do JSON mock
    final dynamic response = historicoCorridasApiResponseJsonMock['response'];
    final List<dynamic> corridasJson = response['corridas'];

    // Mapeia o JSON para Models e converte para Entities
    return corridasJson
        .map((json) => HistoricoCorridasModel.fromJson(json).toEntity())
        .toList();
  }
}
