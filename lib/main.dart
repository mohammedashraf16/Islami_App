import 'package:flutter/material.dart';
import 'package:islami/features/home/home.dart';
import 'package:islami/features/home/tabs/ahadeth/ahadeth_details/hadeth_Details.dart';
import 'package:islami/features/home/tabs/quran/sura_details/sura_details.dart';
import 'package:islami/features/providers/ahadeth_details_provider.dart';
import 'package:islami/features/providers/my_provider.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MyProvider()..getTheme()..getLanguage(),
    ),
    ChangeNotifierProvider(
      create: (context) => AhadethDetailsProvider()..loadHadethFile(),
    ),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<MyProvider>(context).mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      locale:  Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
      },
    );
  }
}
