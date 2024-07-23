import 'package:flutter/material.dart';
import 'package:islami/generated/assets.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;
  List<String> Azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "لا اله الا الله",
    "اللهم صلي علي سيدنا محمد"
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            provider.isDark()
                ? Image.asset(Assets.imagesHeadofseb7aDark)
                : Image.asset(Assets.imagesHeadofseb7a),
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Transform.rotate(
                angle: angle,
                child: GestureDetector(
                  onTap: () {
                    OnTap();
                  },
                  child: provider.isDark() ? Image.asset(
                      Assets.imagesBodyofseb7aDark):Image.asset(
                      Assets.imagesBodyofseb7a)),
              ),
            ),
          ],
        ),
         Padding(
          padding: EdgeInsets.only(top: 27.0),
          child: Text(
            AppLocalizations.of(context)!.number_of_tasbeehs,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("$counter"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:provider.isDark()?yellowColor:primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("${Azkar[index]}"),
            ),
          ),
        ),
      ],
    );
  }

  OnTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter++;
      counter = 0;
    }
    if (index == Azkar.length) {
      index = 0;
    }
    angle += 360 / 4;
    setState(() {});
  }
}
