import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/generated/assets.dart';
import 'package:islami/features/home/tabs/ahadeth/ahadeth_details/hadeth_Details.dart';
import 'package:islami/features/home/tabs/ahadeth/model/hadeth_model.dart';
class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          Assets.imagesAhadethBg,
          height: 219,
        ),
        const Divider(
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          textAlign: TextAlign.center,
          style:Theme.of(context).textTheme.bodyLarge
        ),
        const Divider(
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }


  loadHadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = hadethFile.split("#");

    for (int i = 0; i < ahadeth.length; i++) {
      String hadethOne = ahadeth[i];

      List<String> hadethLines = hadethOne.trim().split("\n");

      String title = hadethLines[0];

      hadethLines.removeAt(0);
      List<String> content = hadethLines;

      HadethModel hadethModel = HadethModel(title, content);
      allAhadeth.add(hadethModel);
      print(hadethModel.title);
      setState(() {});
    }
  }
}
