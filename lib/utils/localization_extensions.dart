import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

///Class that ensures that there is always some form of localization
extension SafeLocalizations on BuildContext {
  AppLocalizations get appLocalizations =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}
