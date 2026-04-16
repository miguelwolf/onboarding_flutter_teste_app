import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

/// Esta classe fornece utilitários para localização (traduções) no app.
///
/// Ela é responsável por obter a localidade atual do device e fornecer
/// uma instância de AppLocalizations para a localidade atual
sealed class LocalizationUtil {
  /// Localidade padrão do app (Português do Brasil)
  static const defaultLocale = Locale('pt', 'BR');

  /// Obtém o código do idioma atual no formato 'xx' (apenas o idioma)
  static String get languageCode =>
      _currentLocale.languageCode.replaceAll(RegExp('-.*'), '');

  /// Obtém a localidade (Locale) atual do device
  static Locale get _currentLocale => ui.PlatformDispatcher.instance.locale;

  /// Obtém o código do idioma atual no formato 'languageCode-countryCode'
  ///
  /// Exemplos: 'pt-BR', 'en-US', 'es-ES'
  static String get currentLanguageCode => _currentLocale.countryCode != null
      ? '${_currentLocale.languageCode}-${_currentLocale.countryCode}'
      : _currentLocale.languageCode;

  static AppLocalizations get appLocalization {
    final locale = _currentLocale;

    final supported = isLocaleSupported(locale);

    final safeLocale = supported ? locale : defaultLocale;

    return lookupAppLocalizations(safeLocale);
  }

  /// Verifica se a localidade fornecida é suportada pelo app
  static bool isLocaleSupported(final Locale? locale) {
    if (locale == null) {
      return false;
    }

    return AppLocalizations.supportedLocales.any((final supported) {
      if (supported.languageCode == locale.languageCode) {
        if (supported.countryCode == null ||
            locale.countryCode == null ||
            supported.countryCode == locale.countryCode) {
          return true;
        }
      }
      return false;
    });
  }

  static LocaleResolutionCallback get localeResolutionCallback {
    return (final locale, final supportedLocales) {
      if (isLocaleSupported(locale)) {
        return locale;
      }
      return defaultLocale;
    };
  }
}
