import 'package:flutter/material.dart';
import 'package:islami/generated/assets.dart';
import 'package:islami/home/tabs/ahadeth/ahadeth.dart';
import 'package:islami/home/tabs/quran/quran.dart';
import 'package:islami/home/tabs/radio/radio.dart';
import 'package:islami/home/tabs/sebha/sebha.dart';
import 'package:islami/home/tabs/settings/settings.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.mode == ThemeMode.light
              ? Assets.imagesMainBg
              : Assets.imagesMainDarkBg,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title, style: Theme.of(context).textTheme.bodyLarge),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon:
                        const ImageIcon(AssetImage(Assets.imagesMoshafBlue),size:35 ,),
                    label: AppLocalizations.of(context)!.quran,
                    backgroundColor:
                        provider.isDark() ? primaryDarkColor : primaryColor),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage(Assets.imagesSebha),size:35),
                    label:AppLocalizations.of(context)!.sebha,
                    backgroundColor:
                        provider.isDark() ? primaryDarkColor : primaryColor),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage(Assets.imagesRadio),size:35),
                    label: AppLocalizations.of(context)!.radio,
                    backgroundColor:
                        provider.isDark() ? primaryDarkColor : primaryColor),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage(Assets.imagesAhadeth),size:35),
                    label: AppLocalizations.of(context)!.ahadeth,
                    backgroundColor:
                        provider.isDark() ? primaryDarkColor : primaryColor),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings,size:35),
                    label: AppLocalizations.of(context)!.settings,
                    backgroundColor:
                        provider.isDark() ? primaryDarkColor : primaryColor),
              ]),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    const SebhaTab(),
    const RadioTab(),
    AhadethTab(),
    const SettingsTab()
  ];
}
