import 'package:flutter/material.dart';
import 'package:islami/home/bottom_sheets/language_bottomsheet.dart';
import 'package:islami/home/bottom_sheets/theme_bottomsheet.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white)
                : Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor:
                    provider.isDark() ? primaryDarkColor : Colors.white,
                builder: (context) {
                  return const ThemeBottomSheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: provider.isDark()?yellowColor:primaryColor,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: primaryColor)),
              child: Text(
                provider.isDark()
                    ? AppLocalizations.of(context)!.dark
                    : AppLocalizations.of(context)!.light,
              ),
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white)
                : Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: provider.isDark()?yellowColor:primaryColor,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: primaryColor)),
              child: Text(provider.appLanguage == "en"
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic),
            ),
          )
        ],
      ),
    );
  }
}
