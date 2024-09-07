import 'package:flutter/material.dart';
import 'package:islami/features/providers/my_provider.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: pro.isDark() ? primaryDarkColor : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                pro.changeLanguage("en");
              },
              child: pro.appLanguage == "en"
                  ? showSelectedItem(
                      context, AppLocalizations.of(context)!.english)
                  : showUnSelectedItem(
                      context, AppLocalizations.of(context)!.english),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                pro.changeLanguage("ar");
              },
              child: pro.appLanguage == "en"
                  ? showUnSelectedItem(
                      context, AppLocalizations.of(context)!.arabic)
                  : showSelectedItem(
                      context, AppLocalizations.of(context)!.arabic),
            ),
          ],
        ),
      ),
    );
  }

  Widget showSelectedItem(BuildContext context, String text) {
    var pro = Provider.of<MyProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: pro.isDark()
              ? Theme.of(context).textTheme.bodyLarge?.copyWith(color: yellowColor)
              : Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: primaryColor),
        ),
        Icon(
          Icons.done,
          size: 30,
          color: pro.isDark()?  yellowColor : primaryColor,
        ),
      ],
    );
  }

  Widget showUnSelectedItem(BuildContext context, String text) {
    var pro = Provider.of<MyProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: pro.appLanguage=="en"
              ? Theme.of(context)
                  .textTheme
                  .bodyLarge
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
    // Icon(Icons.done),
  }
}
