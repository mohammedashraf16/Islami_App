import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/tabs/ahadeth/model/hadeth_model.dart';

class AhadethDetailsProvider extends ChangeNotifier {
  List<HadethModel>allAhadeth=[];
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
      notifyListeners();
    }
  }
}
