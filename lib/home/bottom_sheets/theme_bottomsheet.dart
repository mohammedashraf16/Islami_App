import 'package:flutter/material.dart';
import 'package:islami/theme/my_theme_data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
                pro.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: pro.isDark()
                  ? showSelectedItem(context, "Dark")
                  : showUnSelectedItem(context, "Dark"),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                pro.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: pro.isDark()
                  ? showUnSelectedItem(context, "Light")
                  : showSelectedItem(context, "Light"),
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
              ? Theme.of(context).textTheme.bodyMedium
              : Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: primaryColor),
        ),
        Icon(
          Icons.done,
          size: 30,
          color: pro.isDark() ? yellowColor : primaryColor,
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
          style: pro.isDark()
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white)
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
    // Icon(Icons.done),
  }
}
