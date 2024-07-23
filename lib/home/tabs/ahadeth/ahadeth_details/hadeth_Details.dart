import 'package:flutter/material.dart';
import 'package:islami/home/tabs/ahadeth/model/hadeth_model.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'HadethScreen';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;

    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.isDark()
                ? "assets/images/main_dark_bg.png"
                : "assets/images/main_bg.png",
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            color: provider.isDark()?primaryDarkColor:Colors.white,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    model.content[index],
                    textDirection: TextDirection.rtl,
                    style: provider.isDark()
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 22)
                        : Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 22),
                  ),
                );
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
