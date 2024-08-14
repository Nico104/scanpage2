import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scanpage/features/language/language_selector.dart';
import 'package:scanpage/features/language/m_language.dart';
import 'package:scanpage/utils/utils_general.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LanguageSelector(
              activeLanguage: getLanguageFromKey(context.locale.toString())!,
              unavailableLanguages: const [],
              availableLanguages: availableLanguages,
              title: "appBarLangaugeSettings".tr(),
              heroTag: "settingsLang",
            ),
          ),
        ).then((value) async {
          if (value is Language) {
            await context.setLocale(Locale(value.languageKey));
            //Wait otherwise Language doesnt update .tr()
            await Future.delayed(const Duration(milliseconds: 125));
            // setState(() {});
          }
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "change_Language_Label".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(width: 12),
          Icon(Icons.keyboard_arrow_down_rounded)
        ],
      ),
    );
  }
}
