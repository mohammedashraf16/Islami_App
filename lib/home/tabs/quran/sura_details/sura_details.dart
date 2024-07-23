import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/generated/assets.dart';
import 'package:islami/home/tabs/quran/sura_details/model/sura_model.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/providers/sura_details_provider.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "suraDetails";

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    // var provider=Provider.of<SuraDetailsProvider>(context);
    // if(provider.verses.isEmpty){
    //   provider.loadSuraFile(model.index);
    // }

    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..loadSuraFile(model.index),
        builder: (context, child) {
          MyProvider pro = Provider.of<MyProvider>(context);
          var provider = Provider.of<SuraDetailsProvider>(context);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  pro.isDark()
                      ? Assets.imagesMainDarkBg
                      : Assets.imagesMainBg,
                ),
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  model.name,
                  style: pro.isDark()
                      ? Theme.of(context).textTheme.bodyLarge
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                ),
              ),
              body: Card(
                margin: const EdgeInsets.all(15),
                color: pro.isDark() ? primaryDarkColor : Colors.white,
                elevation: 4,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.transparent)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${provider.verses[index]}(${index + 1})",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          )
                        ],
                      );
                    },
                    itemCount: provider.verses.length,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
