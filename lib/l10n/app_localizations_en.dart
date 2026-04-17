// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mainTitle => 'Taxi Machine onboarding!';

  @override
  String get mainDescription => 'Enter your details to sign in';

  @override
  String get mainLabelNome => 'First Name';

  @override
  String get mainLabelSobrenome => 'Last Name';

  @override
  String get mainLabelEmail => 'Email';

  @override
  String get mainAcaoEntrar => 'Sign In';

  @override
  String get mainCampoObrigatorio => 'Field cannot be empty';

  @override
  String get mapTitle => 'Taxi Machine Map';

  @override
  String get mapVoltar => 'Back';
}
