// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get mainTitle => '¡Bienvenido a Taxi Machine!';

  @override
  String get mainDescription => 'Introduce tus datos para ingresar';

  @override
  String get mainLabelNome => 'Nombre';

  @override
  String get mainLabelSobrenome => 'Apellido';

  @override
  String get mainLabelEmail => 'Correo electrónico';

  @override
  String get mainAcaoEntrar => 'Ingresar';

  @override
  String get mainCampoObrigatorio => 'El campo no puede estar vacío';

  @override
  String get mapTitle => 'Taxi Machine Mapa';

  @override
  String get mapVoltar => 'voltar';
}
