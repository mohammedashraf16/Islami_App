import 'package:flutter/material.dart';
import 'package:islami/generated/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(Assets.imagesRadioimage),
        Text(
          AppLocalizations.of(context)!.holy_quran_radio,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_previous_rounded,
                  size: 40,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 40,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_next_rounded,
                  size: 40,
                )),
          ],
        )
      ],
    );
  }
}
