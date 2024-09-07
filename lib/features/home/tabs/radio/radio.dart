import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/generated/assets.dart';
import 'package:islami/core/services/api/api_manager.dart';
import 'package:islami/features/home/models/radio_model.dart';
import 'package:islami/features/home/widgets/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();
    ApiManager.getRadios();
    return FutureBuilder(
      future: ApiManager.getRadios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Radios>? radios = snapshot.data?.radios ?? [];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .1),
              Expanded(child: Image.asset(Assets.imagesRadioimage)),
              Expanded(
                child: ListView.builder(
                  physics: const PageScrollPhysics(),
                  itemCount: radios.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return RadioItem(
                      player: player,
                      radio: radios[index],
                    );
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }
}
