import 'package:onboarding_flutter_teste_app/domain/historico_corridas/historico_corridas_entity.dart';

class HistoricoCorridasModel extends HistoricoCorridasEntity {
  HistoricoCorridasModel({
    required super.id,
    required super.enderecoOrigem,
    required super.enderecoDestino,
    required super.data,
  });

  factory HistoricoCorridasModel.fromJson(Map<String, dynamic> json) {
    return HistoricoCorridasModel(
      id: json['id'] as int?,
      enderecoOrigem: json['endereco_origem'] as String?,
      enderecoDestino: json['endereco_destino'] as String?,
      data: json['data'] as String?,
    );
  }

  // Isso é o nosso "Mapper" simples
  HistoricoCorridasEntity toEntity() {
    return HistoricoCorridasEntity(
      id: id,
      enderecoOrigem: enderecoOrigem,
      enderecoDestino: enderecoDestino,
      data: data,
    );
  }
}
