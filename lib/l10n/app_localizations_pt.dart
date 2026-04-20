// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get mainTitle => 'Taxi Machine onboarding!';

  @override
  String get mainDescription => 'Insira seus dados para entrar';

  @override
  String get mainLabelNome => 'Nome';

  @override
  String get mainLabelSobrenome => 'Sobrenome';

  @override
  String get mainLabelEmail => 'E-mail';

  @override
  String get mainAcaoEntrar => 'Entrar';

  @override
  String get mainCampoObrigatorio => 'Campo não pode ser vazio';

  @override
  String get mapTitle => 'Taxi Machine Mapa';

  @override
  String get mapVoltar => 'voltar';

  @override
  String get rideHistoryTitle => 'Histórico de corridas';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get mainTitle => 'Boas-vindas ao Taxi Machine!';

  @override
  String get mainDescription => 'Insira os seus dados para entrar';

  @override
  String get mainLabelNome => 'Nome';

  @override
  String get mainLabelSobrenome => 'Apelido';

  @override
  String get mainLabelEmail => 'E-mail';

  @override
  String get mainAcaoEntrar => 'Entrar';

  @override
  String get mainCampoObrigatorio => 'O campo não pode estar vazio';

  @override
  String get mapTitle => 'Taxi Machine Mapa';

  @override
  String get mapVoltar => 'voltar';

  @override
  String get rideHistoryTitle => 'Histórico de corridas';
}
